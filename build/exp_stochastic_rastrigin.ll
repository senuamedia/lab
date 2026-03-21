; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t9 = load i64, ptr %local.state
  %t10 = mul i64 %t9, 1664525
  %t11 = add i64 %t10, 1013904223
  ret i64 %t11
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.12 = alloca i64
  %local.r.13 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t14 = load i64, ptr %local.state
  store i64 %t14, ptr %local.s.12
  %t15 = load i64, ptr %local.s.12
  %t16 = icmp slt i64 %t15, 0
  %t17 = zext i1 %t16 to i64
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then1, label %else1
then1:
  %t19 = load i64, ptr %local.s.12
  %t20 = sub i64 0, %t19
  store i64 %t20, ptr %local.s.12
  br label %then1_end
then1_end:
  br label %endif1
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t21 = phi i64 [ 0, %then1_end ], [ 0, %else1_end ]
  %t22 = load i64, ptr %local.s.12
  %t23 = srem i64 %t22, 2147483647
  store i64 %t23, ptr %local.r.13
  %t24 = load i64, ptr %local.r.13
  %t25 = call i64 @"sx_int_to_f64"(i64 %t24)
  %t26 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.2)
  %t27 = call i64 @"sx_f64_div"(i64 %t25, i64 %t26)
  ret i64 %t27
}

define i64 @"rastrigin_4d"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.pi.28 = alloca i64
  %local.r0.29 = alloca i64
  %local.r1.30 = alloca i64
  %local.r2.31 = alloca i64
  %local.r3.32 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t33 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.3)
  store i64 %t33, ptr %local.pi.28
  %t34 = load i64, ptr %local.w0
  %t35 = load i64, ptr %local.w0
  %t36 = call i64 @"sx_f64_mul"(i64 %t34, i64 %t35)
  %t37 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.4)
  %t38 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.5)
  %t39 = load i64, ptr %local.pi.28
  %t40 = call i64 @"sx_f64_mul"(i64 %t38, i64 %t39)
  %t41 = load i64, ptr %local.w0
  %t42 = call i64 @"sx_f64_mul"(i64 %t40, i64 %t41)
  %t43 = call i64 @"cos_f64"(i64 %t42)
  %t44 = call i64 @"sx_f64_mul"(i64 %t37, i64 %t43)
  %t45 = call i64 @"sx_f64_sub"(i64 %t36, i64 %t44)
  store i64 %t45, ptr %local.r0.29
  %t46 = load i64, ptr %local.w1
  %t47 = load i64, ptr %local.w1
  %t48 = call i64 @"sx_f64_mul"(i64 %t46, i64 %t47)
  %t49 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.6)
  %t50 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.7)
  %t51 = load i64, ptr %local.pi.28
  %t52 = call i64 @"sx_f64_mul"(i64 %t50, i64 %t51)
  %t53 = load i64, ptr %local.w1
  %t54 = call i64 @"sx_f64_mul"(i64 %t52, i64 %t53)
  %t55 = call i64 @"cos_f64"(i64 %t54)
  %t56 = call i64 @"sx_f64_mul"(i64 %t49, i64 %t55)
  %t57 = call i64 @"sx_f64_sub"(i64 %t48, i64 %t56)
  store i64 %t57, ptr %local.r1.30
  %t58 = load i64, ptr %local.w2
  %t59 = load i64, ptr %local.w2
  %t60 = call i64 @"sx_f64_mul"(i64 %t58, i64 %t59)
  %t61 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.8)
  %t62 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.9)
  %t63 = load i64, ptr %local.pi.28
  %t64 = call i64 @"sx_f64_mul"(i64 %t62, i64 %t63)
  %t65 = load i64, ptr %local.w2
  %t66 = call i64 @"sx_f64_mul"(i64 %t64, i64 %t65)
  %t67 = call i64 @"cos_f64"(i64 %t66)
  %t68 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t67)
  %t69 = call i64 @"sx_f64_sub"(i64 %t60, i64 %t68)
  store i64 %t69, ptr %local.r2.31
  %t70 = load i64, ptr %local.w3
  %t71 = load i64, ptr %local.w3
  %t72 = call i64 @"sx_f64_mul"(i64 %t70, i64 %t71)
  %t73 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.10)
  %t74 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.11)
  %t75 = load i64, ptr %local.pi.28
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = load i64, ptr %local.w3
  %t78 = call i64 @"sx_f64_mul"(i64 %t76, i64 %t77)
  %t79 = call i64 @"cos_f64"(i64 %t78)
  %t80 = call i64 @"sx_f64_mul"(i64 %t73, i64 %t79)
  %t81 = call i64 @"sx_f64_sub"(i64 %t72, i64 %t80)
  store i64 %t81, ptr %local.r3.32
  %t82 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.12)
  %t83 = load i64, ptr %local.r0.29
  %t84 = call i64 @"sx_f64_add"(i64 %t82, i64 %t83)
  %t85 = load i64, ptr %local.r1.30
  %t86 = call i64 @"sx_f64_add"(i64 %t84, i64 %t85)
  %t87 = load i64, ptr %local.r2.31
  %t88 = call i64 @"sx_f64_add"(i64 %t86, i64 %t87)
  %t89 = load i64, ptr %local.r3.32
  %t90 = call i64 @"sx_f64_add"(i64 %t88, i64 %t89)
  ret i64 %t90
}

define i64 @"rast_grad"(i64 %w) nounwind {
entry:
  %local.pi.91 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %t92 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.13)
  store i64 %t92, ptr %local.pi.91
  %t93 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.14)
  %t94 = load i64, ptr %local.w
  %t95 = call i64 @"sx_f64_mul"(i64 %t93, i64 %t94)
  %t96 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.15)
  %t97 = load i64, ptr %local.pi.91
  %t98 = call i64 @"sx_f64_mul"(i64 %t96, i64 %t97)
  %t99 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.16)
  %t100 = load i64, ptr %local.pi.91
  %t101 = call i64 @"sx_f64_mul"(i64 %t99, i64 %t100)
  %t102 = load i64, ptr %local.w
  %t103 = call i64 @"sx_f64_mul"(i64 %t101, i64 %t102)
  %t104 = call i64 @"sin_f64"(i64 %t103)
  %t105 = call i64 @"sx_f64_mul"(i64 %t98, i64 %t104)
  %t106 = call i64 @"sx_f64_add"(i64 %t95, i64 %t105)
  ret i64 %t106
}

define i64 @"train_rastrigin"(i64 %t0, i64 %t1, i64 %t2, i64 %t3, i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %v0, i64 %v1, i64 %v2, i64 %v3, i64 %noise_amp, i64 %steps, i64 %lr, i64 %seed) nounwind {
entry:
  %local.w0.107 = alloca i64
  %local.w1.108 = alloca i64
  %local.w2.109 = alloca i64
  %local.w3.110 = alloca i64
  %local.step.111 = alloca i64
  %local.rng.112 = alloca i64
  %local.ga0.113 = alloca i64
  %local.ga1.114 = alloca i64
  %local.ga2.115 = alloca i64
  %local.ga3.116 = alloca i64
  %local.gb0.117 = alloca i64
  %local.gb1.118 = alloca i64
  %local.gb2.119 = alloca i64
  %local.gb3.120 = alloca i64
  %local.gc0.121 = alloca i64
  %local.gc1.122 = alloca i64
  %local.gc2.123 = alloca i64
  %local.gc3.124 = alloca i64
  %local.wa.125 = alloca i64
  %local.wb.126 = alloca i64
  %local.wc.127 = alloca i64
  %local.noise.128 = alloca i64
  %local.la.129 = alloca i64
  %local.lb.130 = alloca i64
  %local.lc.131 = alloca i64
  %local.t0 = alloca i64
  store i64 %t0, ptr %local.t0
  %local.t1 = alloca i64
  store i64 %t1, ptr %local.t1
  %local.t2 = alloca i64
  store i64 %t2, ptr %local.t2
  %local.t3 = alloca i64
  store i64 %t3, ptr %local.t3
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.v0 = alloca i64
  store i64 %v0, ptr %local.v0
  %local.v1 = alloca i64
  store i64 %v1, ptr %local.v1
  %local.v2 = alloca i64
  store i64 %v2, ptr %local.v2
  %local.v3 = alloca i64
  store i64 %v3, ptr %local.v3
  %local.noise_amp = alloca i64
  store i64 %noise_amp, ptr %local.noise_amp
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t132 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.17)
  store i64 %t132, ptr %local.w0.107
  %t133 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.18)
  %t134 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.19)
  %t135 = call i64 @"sx_f64_sub"(i64 %t133, i64 %t134)
  store i64 %t135, ptr %local.w1.108
  %t136 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.20)
  store i64 %t136, ptr %local.w2.109
  %t137 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.21)
  %t138 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.22)
  %t139 = call i64 @"sx_f64_sub"(i64 %t137, i64 %t138)
  store i64 %t139, ptr %local.w3.110
  store i64 0, ptr %local.step.111
  %t140 = load i64, ptr %local.seed
  store i64 %t140, ptr %local.rng.112
  %t141 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.23)
  store i64 %t141, ptr %local.ga0.113
  %t142 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.24)
  store i64 %t142, ptr %local.ga1.114
  %t143 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.25)
  store i64 %t143, ptr %local.ga2.115
  %t144 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.26)
  store i64 %t144, ptr %local.ga3.116
  %t145 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.27)
  store i64 %t145, ptr %local.gb0.117
  %t146 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.28)
  store i64 %t146, ptr %local.gb1.118
  %t147 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.29)
  store i64 %t147, ptr %local.gb2.119
  %t148 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.30)
  store i64 %t148, ptr %local.gb3.120
  %t149 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.31)
  store i64 %t149, ptr %local.gc0.121
  %t150 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.32)
  store i64 %t150, ptr %local.gc1.122
  %t151 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.33)
  store i64 %t151, ptr %local.gc2.123
  %t152 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.34)
  store i64 %t152, ptr %local.gc3.124
  %t153 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.35)
  store i64 %t153, ptr %local.wa.125
  %t154 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.36)
  store i64 %t154, ptr %local.wb.126
  %t155 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.37)
  store i64 %t155, ptr %local.wc.127
  %t156 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.38)
  store i64 %t156, ptr %local.noise.128
  br label %loop2
loop2:
  %t157 = load i64, ptr %local.step.111
  %t158 = load i64, ptr %local.steps
  %t159 = icmp slt i64 %t157, %t158
  %t160 = zext i1 %t159 to i64
  %t161 = icmp ne i64 %t160, 0
  br i1 %t161, label %body2, label %endloop2
body2:
  %t162 = load i64, ptr %local.w0.107
  %t163 = load i64, ptr %local.t0
  %t164 = call i64 @"sx_f64_sub"(i64 %t162, i64 %t163)
  %t165 = call i64 @"rast_grad"(i64 %t164)
  store i64 %t165, ptr %local.ga0.113
  %t166 = load i64, ptr %local.w1.108
  %t167 = load i64, ptr %local.t1
  %t168 = call i64 @"sx_f64_sub"(i64 %t166, i64 %t167)
  %t169 = call i64 @"rast_grad"(i64 %t168)
  store i64 %t169, ptr %local.ga1.114
  %t170 = load i64, ptr %local.w2.109
  %t171 = load i64, ptr %local.t2
  %t172 = call i64 @"sx_f64_sub"(i64 %t170, i64 %t171)
  %t173 = call i64 @"rast_grad"(i64 %t172)
  store i64 %t173, ptr %local.ga2.115
  %t174 = load i64, ptr %local.w3.110
  %t175 = load i64, ptr %local.t3
  %t176 = call i64 @"sx_f64_sub"(i64 %t174, i64 %t175)
  %t177 = call i64 @"rast_grad"(i64 %t176)
  store i64 %t177, ptr %local.ga3.116
  %t178 = load i64, ptr %local.w0.107
  %t179 = load i64, ptr %local.u0
  %t180 = call i64 @"sx_f64_sub"(i64 %t178, i64 %t179)
  %t181 = call i64 @"rast_grad"(i64 %t180)
  store i64 %t181, ptr %local.gb0.117
  %t182 = load i64, ptr %local.w1.108
  %t183 = load i64, ptr %local.u1
  %t184 = call i64 @"sx_f64_sub"(i64 %t182, i64 %t183)
  %t185 = call i64 @"rast_grad"(i64 %t184)
  store i64 %t185, ptr %local.gb1.118
  %t186 = load i64, ptr %local.w2.109
  %t187 = load i64, ptr %local.u2
  %t188 = call i64 @"sx_f64_sub"(i64 %t186, i64 %t187)
  %t189 = call i64 @"rast_grad"(i64 %t188)
  store i64 %t189, ptr %local.gb2.119
  %t190 = load i64, ptr %local.w3.110
  %t191 = load i64, ptr %local.u3
  %t192 = call i64 @"sx_f64_sub"(i64 %t190, i64 %t191)
  %t193 = call i64 @"rast_grad"(i64 %t192)
  store i64 %t193, ptr %local.gb3.120
  %t194 = load i64, ptr %local.w0.107
  %t195 = load i64, ptr %local.v0
  %t196 = call i64 @"sx_f64_sub"(i64 %t194, i64 %t195)
  %t197 = call i64 @"rast_grad"(i64 %t196)
  store i64 %t197, ptr %local.gc0.121
  %t198 = load i64, ptr %local.w1.108
  %t199 = load i64, ptr %local.v1
  %t200 = call i64 @"sx_f64_sub"(i64 %t198, i64 %t199)
  %t201 = call i64 @"rast_grad"(i64 %t200)
  store i64 %t201, ptr %local.gc1.122
  %t202 = load i64, ptr %local.w2.109
  %t203 = load i64, ptr %local.v2
  %t204 = call i64 @"sx_f64_sub"(i64 %t202, i64 %t203)
  %t205 = call i64 @"rast_grad"(i64 %t204)
  store i64 %t205, ptr %local.gc2.123
  %t206 = load i64, ptr %local.w3.110
  %t207 = load i64, ptr %local.v3
  %t208 = call i64 @"sx_f64_sub"(i64 %t206, i64 %t207)
  %t209 = call i64 @"rast_grad"(i64 %t208)
  store i64 %t209, ptr %local.gc3.124
  %t210 = load i64, ptr %local.rng.112
  %t211 = call i64 @"lcg_next"(i64 %t210)
  store i64 %t211, ptr %local.rng.112
  %t212 = load i64, ptr %local.rng.112
  %t213 = call i64 @"lcg_f64"(i64 %t212)
  %t214 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.39)
  %t215 = call i64 @"sx_f64_sub"(i64 %t213, i64 %t214)
  %t216 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.40)
  %t217 = call i64 @"sx_f64_mul"(i64 %t215, i64 %t216)
  %t218 = load i64, ptr %local.noise_amp
  %t219 = call i64 @"sx_f64_mul"(i64 %t217, i64 %t218)
  store i64 %t219, ptr %local.noise.128
  %t220 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.41)
  %t221 = load i64, ptr %local.noise.128
  %t222 = call i64 @"sx_f64_add"(i64 %t220, i64 %t221)
  store i64 %t222, ptr %local.wa.125
  %t223 = load i64, ptr %local.rng.112
  %t224 = call i64 @"lcg_next"(i64 %t223)
  store i64 %t224, ptr %local.rng.112
  %t225 = load i64, ptr %local.rng.112
  %t226 = call i64 @"lcg_f64"(i64 %t225)
  %t227 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.42)
  %t228 = call i64 @"sx_f64_sub"(i64 %t226, i64 %t227)
  %t229 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.43)
  %t230 = call i64 @"sx_f64_mul"(i64 %t228, i64 %t229)
  %t231 = load i64, ptr %local.noise_amp
  %t232 = call i64 @"sx_f64_mul"(i64 %t230, i64 %t231)
  store i64 %t232, ptr %local.noise.128
  %t233 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.44)
  %t234 = load i64, ptr %local.noise.128
  %t235 = call i64 @"sx_f64_add"(i64 %t233, i64 %t234)
  store i64 %t235, ptr %local.wb.126
  %t236 = load i64, ptr %local.rng.112
  %t237 = call i64 @"lcg_next"(i64 %t236)
  store i64 %t237, ptr %local.rng.112
  %t238 = load i64, ptr %local.rng.112
  %t239 = call i64 @"lcg_f64"(i64 %t238)
  %t240 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.45)
  %t241 = call i64 @"sx_f64_sub"(i64 %t239, i64 %t240)
  %t242 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.46)
  %t243 = call i64 @"sx_f64_mul"(i64 %t241, i64 %t242)
  %t244 = load i64, ptr %local.noise_amp
  %t245 = call i64 @"sx_f64_mul"(i64 %t243, i64 %t244)
  store i64 %t245, ptr %local.noise.128
  %t246 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.47)
  %t247 = load i64, ptr %local.noise.128
  %t248 = call i64 @"sx_f64_add"(i64 %t246, i64 %t247)
  store i64 %t248, ptr %local.wc.127
  %t249 = load i64, ptr %local.w0.107
  %t250 = load i64, ptr %local.lr
  %t251 = load i64, ptr %local.wa.125
  %t252 = load i64, ptr %local.ga0.113
  %t253 = call i64 @"sx_f64_mul"(i64 %t251, i64 %t252)
  %t254 = load i64, ptr %local.wb.126
  %t255 = load i64, ptr %local.gb0.117
  %t256 = call i64 @"sx_f64_mul"(i64 %t254, i64 %t255)
  %t257 = call i64 @"sx_f64_add"(i64 %t253, i64 %t256)
  %t258 = load i64, ptr %local.wc.127
  %t259 = load i64, ptr %local.gc0.121
  %t260 = call i64 @"sx_f64_mul"(i64 %t258, i64 %t259)
  %t261 = call i64 @"sx_f64_add"(i64 %t257, i64 %t260)
  %t262 = call i64 @"sx_f64_mul"(i64 %t250, i64 %t261)
  %t263 = call i64 @"sx_f64_sub"(i64 %t249, i64 %t262)
  store i64 %t263, ptr %local.w0.107
  %t264 = load i64, ptr %local.w1.108
  %t265 = load i64, ptr %local.lr
  %t266 = load i64, ptr %local.wa.125
  %t267 = load i64, ptr %local.ga1.114
  %t268 = call i64 @"sx_f64_mul"(i64 %t266, i64 %t267)
  %t269 = load i64, ptr %local.wb.126
  %t270 = load i64, ptr %local.gb1.118
  %t271 = call i64 @"sx_f64_mul"(i64 %t269, i64 %t270)
  %t272 = call i64 @"sx_f64_add"(i64 %t268, i64 %t271)
  %t273 = load i64, ptr %local.wc.127
  %t274 = load i64, ptr %local.gc1.122
  %t275 = call i64 @"sx_f64_mul"(i64 %t273, i64 %t274)
  %t276 = call i64 @"sx_f64_add"(i64 %t272, i64 %t275)
  %t277 = call i64 @"sx_f64_mul"(i64 %t265, i64 %t276)
  %t278 = call i64 @"sx_f64_sub"(i64 %t264, i64 %t277)
  store i64 %t278, ptr %local.w1.108
  %t279 = load i64, ptr %local.w2.109
  %t280 = load i64, ptr %local.lr
  %t281 = load i64, ptr %local.wa.125
  %t282 = load i64, ptr %local.ga2.115
  %t283 = call i64 @"sx_f64_mul"(i64 %t281, i64 %t282)
  %t284 = load i64, ptr %local.wb.126
  %t285 = load i64, ptr %local.gb2.119
  %t286 = call i64 @"sx_f64_mul"(i64 %t284, i64 %t285)
  %t287 = call i64 @"sx_f64_add"(i64 %t283, i64 %t286)
  %t288 = load i64, ptr %local.wc.127
  %t289 = load i64, ptr %local.gc2.123
  %t290 = call i64 @"sx_f64_mul"(i64 %t288, i64 %t289)
  %t291 = call i64 @"sx_f64_add"(i64 %t287, i64 %t290)
  %t292 = call i64 @"sx_f64_mul"(i64 %t280, i64 %t291)
  %t293 = call i64 @"sx_f64_sub"(i64 %t279, i64 %t292)
  store i64 %t293, ptr %local.w2.109
  %t294 = load i64, ptr %local.w3.110
  %t295 = load i64, ptr %local.lr
  %t296 = load i64, ptr %local.wa.125
  %t297 = load i64, ptr %local.ga3.116
  %t298 = call i64 @"sx_f64_mul"(i64 %t296, i64 %t297)
  %t299 = load i64, ptr %local.wb.126
  %t300 = load i64, ptr %local.gb3.120
  %t301 = call i64 @"sx_f64_mul"(i64 %t299, i64 %t300)
  %t302 = call i64 @"sx_f64_add"(i64 %t298, i64 %t301)
  %t303 = load i64, ptr %local.wc.127
  %t304 = load i64, ptr %local.gc3.124
  %t305 = call i64 @"sx_f64_mul"(i64 %t303, i64 %t304)
  %t306 = call i64 @"sx_f64_add"(i64 %t302, i64 %t305)
  %t307 = call i64 @"sx_f64_mul"(i64 %t295, i64 %t306)
  %t308 = call i64 @"sx_f64_sub"(i64 %t294, i64 %t307)
  store i64 %t308, ptr %local.w3.110
  %t309 = load i64, ptr %local.step.111
  %t310 = add i64 %t309, 1
  store i64 %t310, ptr %local.step.111
  br label %loop2
endloop2:
  %t311 = load i64, ptr %local.w0.107
  %t312 = load i64, ptr %local.t0
  %t313 = call i64 @"sx_f64_sub"(i64 %t311, i64 %t312)
  %t314 = load i64, ptr %local.w1.108
  %t315 = load i64, ptr %local.t1
  %t316 = call i64 @"sx_f64_sub"(i64 %t314, i64 %t315)
  %t317 = load i64, ptr %local.w2.109
  %t318 = load i64, ptr %local.t2
  %t319 = call i64 @"sx_f64_sub"(i64 %t317, i64 %t318)
  %t320 = load i64, ptr %local.w3.110
  %t321 = load i64, ptr %local.t3
  %t322 = call i64 @"sx_f64_sub"(i64 %t320, i64 %t321)
  %t323 = call i64 @"rastrigin_4d"(i64 %t313, i64 %t316, i64 %t319, i64 %t322)
  store i64 %t323, ptr %local.la.129
  %t324 = load i64, ptr %local.w0.107
  %t325 = load i64, ptr %local.u0
  %t326 = call i64 @"sx_f64_sub"(i64 %t324, i64 %t325)
  %t327 = load i64, ptr %local.w1.108
  %t328 = load i64, ptr %local.u1
  %t329 = call i64 @"sx_f64_sub"(i64 %t327, i64 %t328)
  %t330 = load i64, ptr %local.w2.109
  %t331 = load i64, ptr %local.u2
  %t332 = call i64 @"sx_f64_sub"(i64 %t330, i64 %t331)
  %t333 = load i64, ptr %local.w3.110
  %t334 = load i64, ptr %local.u3
  %t335 = call i64 @"sx_f64_sub"(i64 %t333, i64 %t334)
  %t336 = call i64 @"rastrigin_4d"(i64 %t326, i64 %t329, i64 %t332, i64 %t335)
  store i64 %t336, ptr %local.lb.130
  %t337 = load i64, ptr %local.w0.107
  %t338 = load i64, ptr %local.v0
  %t339 = call i64 @"sx_f64_sub"(i64 %t337, i64 %t338)
  %t340 = load i64, ptr %local.w1.108
  %t341 = load i64, ptr %local.v1
  %t342 = call i64 @"sx_f64_sub"(i64 %t340, i64 %t341)
  %t343 = load i64, ptr %local.w2.109
  %t344 = load i64, ptr %local.v2
  %t345 = call i64 @"sx_f64_sub"(i64 %t343, i64 %t344)
  %t346 = load i64, ptr %local.w3.110
  %t347 = load i64, ptr %local.v3
  %t348 = call i64 @"sx_f64_sub"(i64 %t346, i64 %t347)
  %t349 = call i64 @"rastrigin_4d"(i64 %t339, i64 %t342, i64 %t345, i64 %t348)
  store i64 %t349, ptr %local.lc.131
  %t350 = load i64, ptr %local.la.129
  %t351 = load i64, ptr %local.lb.130
  %t352 = call i64 @"sx_f64_add"(i64 %t350, i64 %t351)
  %t353 = load i64, ptr %local.lc.131
  %t354 = call i64 @"sx_f64_add"(i64 %t352, i64 %t353)
  ret i64 %t354
}

define i64 @"avg_loss"(i64 %t0, i64 %t1, i64 %t2, i64 %t3, i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %v0, i64 %v1, i64 %v2, i64 %v3, i64 %amp, i64 %steps, i64 %lr) nounwind {
entry:
  %local.l1.355 = alloca i64
  %local.l2.356 = alloca i64
  %local.l3.357 = alloca i64
  %local.t0 = alloca i64
  store i64 %t0, ptr %local.t0
  %local.t1 = alloca i64
  store i64 %t1, ptr %local.t1
  %local.t2 = alloca i64
  store i64 %t2, ptr %local.t2
  %local.t3 = alloca i64
  store i64 %t3, ptr %local.t3
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.v0 = alloca i64
  store i64 %v0, ptr %local.v0
  %local.v1 = alloca i64
  store i64 %v1, ptr %local.v1
  %local.v2 = alloca i64
  store i64 %v2, ptr %local.v2
  %local.v3 = alloca i64
  store i64 %v3, ptr %local.v3
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %t358 = load i64, ptr %local.t0
  %t359 = load i64, ptr %local.t1
  %t360 = load i64, ptr %local.t2
  %t361 = load i64, ptr %local.t3
  %t362 = load i64, ptr %local.u0
  %t363 = load i64, ptr %local.u1
  %t364 = load i64, ptr %local.u2
  %t365 = load i64, ptr %local.u3
  %t366 = load i64, ptr %local.v0
  %t367 = load i64, ptr %local.v1
  %t368 = load i64, ptr %local.v2
  %t369 = load i64, ptr %local.v3
  %t370 = load i64, ptr %local.amp
  %t371 = load i64, ptr %local.steps
  %t372 = load i64, ptr %local.lr
  %t373 = call i64 @"train_rastrigin"(i64 %t358, i64 %t359, i64 %t360, i64 %t361, i64 %t362, i64 %t363, i64 %t364, i64 %t365, i64 %t366, i64 %t367, i64 %t368, i64 %t369, i64 %t370, i64 %t371, i64 %t372, i64 42)
  store i64 %t373, ptr %local.l1.355
  %t374 = load i64, ptr %local.t0
  %t375 = load i64, ptr %local.t1
  %t376 = load i64, ptr %local.t2
  %t377 = load i64, ptr %local.t3
  %t378 = load i64, ptr %local.u0
  %t379 = load i64, ptr %local.u1
  %t380 = load i64, ptr %local.u2
  %t381 = load i64, ptr %local.u3
  %t382 = load i64, ptr %local.v0
  %t383 = load i64, ptr %local.v1
  %t384 = load i64, ptr %local.v2
  %t385 = load i64, ptr %local.v3
  %t386 = load i64, ptr %local.amp
  %t387 = load i64, ptr %local.steps
  %t388 = load i64, ptr %local.lr
  %t389 = call i64 @"train_rastrigin"(i64 %t374, i64 %t375, i64 %t376, i64 %t377, i64 %t378, i64 %t379, i64 %t380, i64 %t381, i64 %t382, i64 %t383, i64 %t384, i64 %t385, i64 %t386, i64 %t387, i64 %t388, i64 137)
  store i64 %t389, ptr %local.l2.356
  %t390 = load i64, ptr %local.t0
  %t391 = load i64, ptr %local.t1
  %t392 = load i64, ptr %local.t2
  %t393 = load i64, ptr %local.t3
  %t394 = load i64, ptr %local.u0
  %t395 = load i64, ptr %local.u1
  %t396 = load i64, ptr %local.u2
  %t397 = load i64, ptr %local.u3
  %t398 = load i64, ptr %local.v0
  %t399 = load i64, ptr %local.v1
  %t400 = load i64, ptr %local.v2
  %t401 = load i64, ptr %local.v3
  %t402 = load i64, ptr %local.amp
  %t403 = load i64, ptr %local.steps
  %t404 = load i64, ptr %local.lr
  %t405 = call i64 @"train_rastrigin"(i64 %t390, i64 %t391, i64 %t392, i64 %t393, i64 %t394, i64 %t395, i64 %t396, i64 %t397, i64 %t398, i64 %t399, i64 %t400, i64 %t401, i64 %t402, i64 %t403, i64 %t404, i64 999)
  store i64 %t405, ptr %local.l3.357
  %t406 = load i64, ptr %local.l1.355
  %t407 = load i64, ptr %local.l2.356
  %t408 = call i64 @"sx_f64_add"(i64 %t406, i64 %t407)
  %t409 = load i64, ptr %local.l3.357
  %t410 = call i64 @"sx_f64_add"(i64 %t408, i64 %t409)
  %t411 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.48)
  %t412 = call i64 @"sx_f64_div"(i64 %t410, i64 %t411)
  ret i64 %t412
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.t0.413 = alloca i64
  %local.t1.414 = alloca i64
  %local.t2.415 = alloca i64
  %local.t3.416 = alloca i64
  %local.u0.417 = alloca i64
  %local.u1.418 = alloca i64
  %local.u2.419 = alloca i64
  %local.u3.420 = alloca i64
  %local.v0.421 = alloca i64
  %local.v1.422 = alloca i64
  %local.v2.423 = alloca i64
  %local.v3.424 = alloca i64
  %local.steps.425 = alloca i64
  %local.lr.426 = alloca i64
  %local.best_amp.427 = alloca i64
  %local.best_loss.428 = alloca i64
  %local.sweep.429 = alloca i64
  %local.amp.430 = alloca i64
  %local.loss.431 = alloca i64
  %local.learned.432 = alloca i64
  %local.cycle.433 = alloca i64
  %local.h.434 = alloca i64
  %local.mlr.435 = alloca i64
  %local.lp.436 = alloca i64
  %local.lm.437 = alloca i64
  %local.mg.438 = alloca i64
  %local.final_loss.439 = alloca i64
  %local.zero_loss.440 = alloca i64
  %t441 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.49)
  %t442 = ptrtoint ptr %t441 to i64
  %t443 = inttoptr i64 %t442 to ptr
  call void @intrinsic_println(ptr %t443)
  %t444 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.50)
  %t445 = ptrtoint ptr %t444 to i64
  %t446 = inttoptr i64 %t445 to ptr
  call void @intrinsic_println(ptr %t446)
  %t447 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.51)
  %t448 = ptrtoint ptr %t447 to i64
  %t449 = inttoptr i64 %t448 to ptr
  call void @intrinsic_println(ptr %t449)
  %t450 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.52)
  %t451 = ptrtoint ptr %t450 to i64
  %t452 = inttoptr i64 %t451 to ptr
  call void @intrinsic_println(ptr %t452)
  %t453 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.53)
  %t454 = ptrtoint ptr %t453 to i64
  %t455 = inttoptr i64 %t454 to ptr
  call void @intrinsic_println(ptr %t455)
  %t456 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.54)
  store i64 %t456, ptr %local.t0.413
  %t457 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.55)
  store i64 %t457, ptr %local.t1.414
  %t458 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.56)
  %t459 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.57)
  %t460 = call i64 @"sx_f64_sub"(i64 %t458, i64 %t459)
  store i64 %t460, ptr %local.t2.415
  %t461 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.58)
  store i64 %t461, ptr %local.t3.416
  %t462 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.59)
  %t463 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.60)
  %t464 = call i64 @"sx_f64_sub"(i64 %t462, i64 %t463)
  store i64 %t464, ptr %local.u0.417
  %t465 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.61)
  %t466 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.62)
  %t467 = call i64 @"sx_f64_sub"(i64 %t465, i64 %t466)
  store i64 %t467, ptr %local.u1.418
  %t468 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.63)
  store i64 %t468, ptr %local.u2.419
  %t469 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.64)
  %t470 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.65)
  %t471 = call i64 @"sx_f64_sub"(i64 %t469, i64 %t470)
  store i64 %t471, ptr %local.u3.420
  %t472 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.66)
  store i64 %t472, ptr %local.v0.421
  %t473 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.67)
  %t474 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.68)
  %t475 = call i64 @"sx_f64_sub"(i64 %t473, i64 %t474)
  store i64 %t475, ptr %local.v1.422
  %t476 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.69)
  %t477 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.70)
  %t478 = call i64 @"sx_f64_sub"(i64 %t476, i64 %t477)
  store i64 %t478, ptr %local.v2.423
  %t479 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.71)
  store i64 %t479, ptr %local.v3.424
  store i64 2000, ptr %local.steps.425
  %t480 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.72)
  store i64 %t480, ptr %local.lr.426
  %t481 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.73)
  %t482 = ptrtoint ptr %t481 to i64
  %t483 = inttoptr i64 %t482 to ptr
  call void @intrinsic_println(ptr %t483)
  %t484 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.74)
  %t485 = ptrtoint ptr %t484 to i64
  %t486 = inttoptr i64 %t485 to ptr
  call void @intrinsic_println(ptr %t486)
  %t487 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.75)
  %t488 = ptrtoint ptr %t487 to i64
  %t489 = inttoptr i64 %t488 to ptr
  call void @intrinsic_println(ptr %t489)
  %t490 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.76)
  store i64 %t490, ptr %local.best_amp.427
  %t491 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.77)
  store i64 %t491, ptr %local.best_loss.428
  store i64 0, ptr %local.sweep.429
  %t492 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.78)
  store i64 %t492, ptr %local.amp.430
  br label %loop3
loop3:
  %t493 = load i64, ptr %local.sweep.429
  %t494 = icmp slt i64 %t493, 11
  %t495 = zext i1 %t494 to i64
  %t496 = icmp ne i64 %t495, 0
  br i1 %t496, label %body3, label %endloop3
body3:
  %t497 = load i64, ptr %local.sweep.429
  %t498 = call i64 @"sx_int_to_f64"(i64 %t497)
  %t499 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.79)
  %t500 = call i64 @"sx_f64_mul"(i64 %t498, i64 %t499)
  store i64 %t500, ptr %local.amp.430
  %t501 = load i64, ptr %local.t0.413
  %t502 = load i64, ptr %local.t1.414
  %t503 = load i64, ptr %local.t2.415
  %t504 = load i64, ptr %local.t3.416
  %t505 = load i64, ptr %local.u0.417
  %t506 = load i64, ptr %local.u1.418
  %t507 = load i64, ptr %local.u2.419
  %t508 = load i64, ptr %local.u3.420
  %t509 = load i64, ptr %local.v0.421
  %t510 = load i64, ptr %local.v1.422
  %t511 = load i64, ptr %local.v2.423
  %t512 = load i64, ptr %local.v3.424
  %t513 = load i64, ptr %local.amp.430
  %t514 = load i64, ptr %local.steps.425
  %t515 = load i64, ptr %local.lr.426
  %t516 = call i64 @"avg_loss"(i64 %t501, i64 %t502, i64 %t503, i64 %t504, i64 %t505, i64 %t506, i64 %t507, i64 %t508, i64 %t509, i64 %t510, i64 %t511, i64 %t512, i64 %t513, i64 %t514, i64 %t515)
  store i64 %t516, ptr %local.loss.431
  %t517 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.80)
  %t518 = ptrtoint ptr %t517 to i64
  %t519 = inttoptr i64 %t518 to ptr
  call void @intrinsic_print(ptr %t519)
  %t520 = load i64, ptr %local.amp.430
  %t521 = call i64 @"print_f64"(i64 %t520)
  %t522 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.81)
  %t523 = ptrtoint ptr %t522 to i64
  %t524 = inttoptr i64 %t523 to ptr
  call void @intrinsic_print(ptr %t524)
  %t525 = load i64, ptr %local.loss.431
  %t526 = call i64 @"print_f64"(i64 %t525)
  %t527 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.82)
  %t528 = ptrtoint ptr %t527 to i64
  %t529 = inttoptr i64 %t528 to ptr
  call void @intrinsic_println(ptr %t529)
  %t530 = load i64, ptr %local.loss.431
  %t531 = load i64, ptr %local.best_loss.428
  %t532 = call i64 @"sx_f64_lt"(i64 %t530, i64 %t531)
  %t533 = icmp ne i64 %t532, 0
  br i1 %t533, label %then4, label %else4
then4:
  %t534 = load i64, ptr %local.loss.431
  store i64 %t534, ptr %local.best_loss.428
  %t535 = load i64, ptr %local.amp.430
  store i64 %t535, ptr %local.best_amp.427
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t536 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t537 = load i64, ptr %local.sweep.429
  %t538 = add i64 %t537, 1
  store i64 %t538, ptr %local.sweep.429
  br label %loop3
endloop3:
  %t539 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.83)
  %t540 = ptrtoint ptr %t539 to i64
  %t541 = inttoptr i64 %t540 to ptr
  call void @intrinsic_println(ptr %t541)
  %t542 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.84)
  %t543 = ptrtoint ptr %t542 to i64
  %t544 = inttoptr i64 %t543 to ptr
  call void @intrinsic_print(ptr %t544)
  %t545 = load i64, ptr %local.best_amp.427
  %t546 = call i64 @"print_f64"(i64 %t545)
  %t547 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.85)
  %t548 = ptrtoint ptr %t547 to i64
  %t549 = inttoptr i64 %t548 to ptr
  call void @intrinsic_print(ptr %t549)
  %t550 = load i64, ptr %local.best_loss.428
  %t551 = call i64 @"print_f64"(i64 %t550)
  %t552 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.86)
  %t553 = ptrtoint ptr %t552 to i64
  %t554 = inttoptr i64 %t553 to ptr
  call void @intrinsic_println(ptr %t554)
  %t555 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.87)
  %t556 = ptrtoint ptr %t555 to i64
  %t557 = inttoptr i64 %t556 to ptr
  call void @intrinsic_println(ptr %t557)
  %t558 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.88)
  %t559 = ptrtoint ptr %t558 to i64
  %t560 = inttoptr i64 %t559 to ptr
  call void @intrinsic_println(ptr %t560)
  %t561 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.89)
  store i64 %t561, ptr %local.learned.432
  store i64 0, ptr %local.cycle.433
  %t562 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.90)
  store i64 %t562, ptr %local.h.434
  %t563 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.91)
  store i64 %t563, ptr %local.mlr.435
  br label %loop5
loop5:
  %t564 = load i64, ptr %local.cycle.433
  %t565 = icmp slt i64 %t564, 20
  %t566 = zext i1 %t565 to i64
  %t567 = icmp ne i64 %t566, 0
  br i1 %t567, label %body5, label %endloop5
body5:
  %t568 = load i64, ptr %local.t0.413
  %t569 = load i64, ptr %local.t1.414
  %t570 = load i64, ptr %local.t2.415
  %t571 = load i64, ptr %local.t3.416
  %t572 = load i64, ptr %local.u0.417
  %t573 = load i64, ptr %local.u1.418
  %t574 = load i64, ptr %local.u2.419
  %t575 = load i64, ptr %local.u3.420
  %t576 = load i64, ptr %local.v0.421
  %t577 = load i64, ptr %local.v1.422
  %t578 = load i64, ptr %local.v2.423
  %t579 = load i64, ptr %local.v3.424
  %t580 = load i64, ptr %local.learned.432
  %t581 = load i64, ptr %local.h.434
  %t582 = call i64 @"sx_f64_add"(i64 %t580, i64 %t581)
  %t583 = load i64, ptr %local.steps.425
  %t584 = load i64, ptr %local.lr.426
  %t585 = call i64 @"avg_loss"(i64 %t568, i64 %t569, i64 %t570, i64 %t571, i64 %t572, i64 %t573, i64 %t574, i64 %t575, i64 %t576, i64 %t577, i64 %t578, i64 %t579, i64 %t582, i64 %t583, i64 %t584)
  store i64 %t585, ptr %local.lp.436
  %t586 = load i64, ptr %local.t0.413
  %t587 = load i64, ptr %local.t1.414
  %t588 = load i64, ptr %local.t2.415
  %t589 = load i64, ptr %local.t3.416
  %t590 = load i64, ptr %local.u0.417
  %t591 = load i64, ptr %local.u1.418
  %t592 = load i64, ptr %local.u2.419
  %t593 = load i64, ptr %local.u3.420
  %t594 = load i64, ptr %local.v0.421
  %t595 = load i64, ptr %local.v1.422
  %t596 = load i64, ptr %local.v2.423
  %t597 = load i64, ptr %local.v3.424
  %t598 = load i64, ptr %local.learned.432
  %t599 = load i64, ptr %local.h.434
  %t600 = call i64 @"sx_f64_sub"(i64 %t598, i64 %t599)
  %t601 = load i64, ptr %local.steps.425
  %t602 = load i64, ptr %local.lr.426
  %t603 = call i64 @"avg_loss"(i64 %t586, i64 %t587, i64 %t588, i64 %t589, i64 %t590, i64 %t591, i64 %t592, i64 %t593, i64 %t594, i64 %t595, i64 %t596, i64 %t597, i64 %t600, i64 %t601, i64 %t602)
  store i64 %t603, ptr %local.lm.437
  %t604 = load i64, ptr %local.lp.436
  %t605 = load i64, ptr %local.lm.437
  %t606 = call i64 @"sx_f64_sub"(i64 %t604, i64 %t605)
  %t607 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.92)
  %t608 = load i64, ptr %local.h.434
  %t609 = call i64 @"sx_f64_mul"(i64 %t607, i64 %t608)
  %t610 = call i64 @"sx_f64_div"(i64 %t606, i64 %t609)
  store i64 %t610, ptr %local.mg.438
  %t611 = load i64, ptr %local.learned.432
  %t612 = load i64, ptr %local.mlr.435
  %t613 = load i64, ptr %local.mg.438
  %t614 = call i64 @"sx_f64_mul"(i64 %t612, i64 %t613)
  %t615 = call i64 @"sx_f64_sub"(i64 %t611, i64 %t614)
  store i64 %t615, ptr %local.learned.432
  %t616 = load i64, ptr %local.learned.432
  %t617 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.93)
  %t618 = call i64 @"sx_f64_lt"(i64 %t616, i64 %t617)
  %t619 = icmp ne i64 %t618, 0
  br i1 %t619, label %then6, label %else6
then6:
  %t620 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.94)
  store i64 %t620, ptr %local.learned.432
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t621 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t622 = load i64, ptr %local.learned.432
  %t623 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.95)
  %t624 = call i64 @"sx_f64_gt"(i64 %t622, i64 %t623)
  %t625 = icmp ne i64 %t624, 0
  br i1 %t625, label %then7, label %else7
then7:
  %t626 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.96)
  store i64 %t626, ptr %local.learned.432
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t627 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t628 = load i64, ptr %local.cycle.433
  %t629 = icmp slt i64 %t628, 3
  %t630 = zext i1 %t629 to i64
  %t631 = icmp ne i64 %t630, 0
  br i1 %t631, label %then8, label %else8
then8:
  %t632 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.97)
  %t633 = ptrtoint ptr %t632 to i64
  %t634 = inttoptr i64 %t633 to ptr
  call void @intrinsic_print(ptr %t634)
  %t635 = load i64, ptr %local.cycle.433
  call void @print_i64(i64 %t635)
  %t636 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.98)
  %t637 = ptrtoint ptr %t636 to i64
  %t638 = inttoptr i64 %t637 to ptr
  call void @intrinsic_print(ptr %t638)
  %t639 = load i64, ptr %local.learned.432
  %t640 = call i64 @"print_f64"(i64 %t639)
  %t641 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.99)
  %t642 = ptrtoint ptr %t641 to i64
  %t643 = inttoptr i64 %t642 to ptr
  call void @intrinsic_print(ptr %t643)
  %t644 = load i64, ptr %local.mg.438
  %t645 = call i64 @"print_f64"(i64 %t644)
  %t646 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.100)
  %t647 = ptrtoint ptr %t646 to i64
  %t648 = inttoptr i64 %t647 to ptr
  call void @intrinsic_println(ptr %t648)
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t649 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t650 = load i64, ptr %local.cycle.433
  %t651 = icmp eq i64 %t650, 19
  %t652 = zext i1 %t651 to i64
  %t653 = icmp ne i64 %t652, 0
  br i1 %t653, label %then9, label %else9
then9:
  %t654 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.101)
  %t655 = ptrtoint ptr %t654 to i64
  %t656 = inttoptr i64 %t655 to ptr
  call void @intrinsic_print(ptr %t656)
  %t657 = load i64, ptr %local.learned.432
  %t658 = call i64 @"print_f64"(i64 %t657)
  %t659 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.102)
  %t660 = ptrtoint ptr %t659 to i64
  %t661 = inttoptr i64 %t660 to ptr
  call void @intrinsic_println(ptr %t661)
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t662 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t663 = load i64, ptr %local.cycle.433
  %t664 = add i64 %t663, 1
  store i64 %t664, ptr %local.cycle.433
  br label %loop5
endloop5:
  %t665 = load i64, ptr %local.t0.413
  %t666 = load i64, ptr %local.t1.414
  %t667 = load i64, ptr %local.t2.415
  %t668 = load i64, ptr %local.t3.416
  %t669 = load i64, ptr %local.u0.417
  %t670 = load i64, ptr %local.u1.418
  %t671 = load i64, ptr %local.u2.419
  %t672 = load i64, ptr %local.u3.420
  %t673 = load i64, ptr %local.v0.421
  %t674 = load i64, ptr %local.v1.422
  %t675 = load i64, ptr %local.v2.423
  %t676 = load i64, ptr %local.v3.424
  %t677 = load i64, ptr %local.learned.432
  %t678 = load i64, ptr %local.steps.425
  %t679 = load i64, ptr %local.lr.426
  %t680 = call i64 @"avg_loss"(i64 %t665, i64 %t666, i64 %t667, i64 %t668, i64 %t669, i64 %t670, i64 %t671, i64 %t672, i64 %t673, i64 %t674, i64 %t675, i64 %t676, i64 %t677, i64 %t678, i64 %t679)
  store i64 %t680, ptr %local.final_loss.439
  %t681 = load i64, ptr %local.t0.413
  %t682 = load i64, ptr %local.t1.414
  %t683 = load i64, ptr %local.t2.415
  %t684 = load i64, ptr %local.t3.416
  %t685 = load i64, ptr %local.u0.417
  %t686 = load i64, ptr %local.u1.418
  %t687 = load i64, ptr %local.u2.419
  %t688 = load i64, ptr %local.u3.420
  %t689 = load i64, ptr %local.v0.421
  %t690 = load i64, ptr %local.v1.422
  %t691 = load i64, ptr %local.v2.423
  %t692 = load i64, ptr %local.v3.424
  %t693 = call i64 @f64_parse(ptr @.str.exp_stochastic_rastrigin.103)
  %t694 = load i64, ptr %local.steps.425
  %t695 = load i64, ptr %local.lr.426
  %t696 = call i64 @"avg_loss"(i64 %t681, i64 %t682, i64 %t683, i64 %t684, i64 %t685, i64 %t686, i64 %t687, i64 %t688, i64 %t689, i64 %t690, i64 %t691, i64 %t692, i64 %t693, i64 %t694, i64 %t695)
  store i64 %t696, ptr %local.zero_loss.440
  %t697 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.104)
  %t698 = ptrtoint ptr %t697 to i64
  %t699 = inttoptr i64 %t698 to ptr
  call void @intrinsic_println(ptr %t699)
  %t700 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.105)
  %t701 = ptrtoint ptr %t700 to i64
  %t702 = inttoptr i64 %t701 to ptr
  call void @intrinsic_print(ptr %t702)
  %t703 = load i64, ptr %local.zero_loss.440
  %t704 = call i64 @"print_f64"(i64 %t703)
  %t705 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.106)
  %t706 = ptrtoint ptr %t705 to i64
  %t707 = inttoptr i64 %t706 to ptr
  call void @intrinsic_println(ptr %t707)
  %t708 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.107)
  %t709 = ptrtoint ptr %t708 to i64
  %t710 = inttoptr i64 %t709 to ptr
  call void @intrinsic_print(ptr %t710)
  %t711 = load i64, ptr %local.learned.432
  %t712 = call i64 @"print_f64"(i64 %t711)
  %t713 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.108)
  %t714 = ptrtoint ptr %t713 to i64
  %t715 = inttoptr i64 %t714 to ptr
  call void @intrinsic_print(ptr %t715)
  %t716 = load i64, ptr %local.final_loss.439
  %t717 = call i64 @"print_f64"(i64 %t716)
  %t718 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.109)
  %t719 = ptrtoint ptr %t718 to i64
  %t720 = inttoptr i64 %t719 to ptr
  call void @intrinsic_println(ptr %t720)
  %t721 = load i64, ptr %local.final_loss.439
  %t722 = load i64, ptr %local.zero_loss.440
  %t723 = call i64 @"sx_f64_lt"(i64 %t721, i64 %t722)
  %t724 = icmp ne i64 %t723, 0
  br i1 %t724, label %then10, label %else10
then10:
  %t725 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.110)
  %t726 = ptrtoint ptr %t725 to i64
  %t727 = inttoptr i64 %t726 to ptr
  call void @intrinsic_println(ptr %t727)
  %t728 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.111)
  %t729 = ptrtoint ptr %t728 to i64
  %t730 = inttoptr i64 %t729 to ptr
  call void @intrinsic_println(ptr %t730)
  %t731 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.112)
  %t732 = ptrtoint ptr %t731 to i64
  %t733 = inttoptr i64 %t732 to ptr
  call void @intrinsic_println(ptr %t733)
  %t734 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.113)
  %t735 = ptrtoint ptr %t734 to i64
  %t736 = inttoptr i64 %t735 to ptr
  call void @intrinsic_println(ptr %t736)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t737 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.114)
  %t738 = ptrtoint ptr %t737 to i64
  %t739 = inttoptr i64 %t738 to ptr
  call void @intrinsic_println(ptr %t739)
  %t740 = call ptr @intrinsic_string_new(ptr @.str.exp_stochastic_rastrigin.115)
  %t741 = ptrtoint ptr %t740 to i64
  %t742 = inttoptr i64 %t741 to ptr
  call void @intrinsic_println(ptr %t742)
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t743 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  ret i64 0
}


; String constants
@.str.exp_stochastic_rastrigin.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.2 = private unnamed_addr constant [13 x i8] c"2147483647.0\00"
@.str.exp_stochastic_rastrigin.3 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_stochastic_rastrigin.4 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_stochastic_rastrigin.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.6 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_stochastic_rastrigin.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.8 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_stochastic_rastrigin.9 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.10 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_stochastic_rastrigin.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.12 = private unnamed_addr constant [5 x i8] c"40.0\00"
@.str.exp_stochastic_rastrigin.13 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_stochastic_rastrigin.14 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.15 = private unnamed_addr constant [5 x i8] c"20.0\00"
@.str.exp_stochastic_rastrigin.16 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.17 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_stochastic_rastrigin.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.19 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_stochastic_rastrigin.20 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_stochastic_rastrigin.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.22 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.37 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.39 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_rastrigin.40 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.41 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_rastrigin.42 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_rastrigin.43 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.44 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_rastrigin.45 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_rastrigin.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.47 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_rastrigin.48 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_stochastic_rastrigin.49 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_stochastic_rastrigin.50 = private unnamed_addr constant [36 x i8] c"  STOCHASTIC RASTRIGIN (MULTIMODAL)\00"
@.str.exp_stochastic_rastrigin.51 = private unnamed_addr constant [33 x i8] c"  Can noise escape local minima?\00"
@.str.exp_stochastic_rastrigin.52 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_stochastic_rastrigin.53 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.54 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_rastrigin.55 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.57 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stochastic_rastrigin.58 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_rastrigin.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.60 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_stochastic_rastrigin.61 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.62 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_rastrigin.63 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_stochastic_rastrigin.64 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.65 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.66 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_rastrigin.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.68 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.69 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.70 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_rastrigin.71 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_stochastic_rastrigin.72 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_stochastic_rastrigin.73 = private unnamed_addr constant [44 x i8] c"--- Noise amplitude sweep (avg 3 seeds) ---\00"
@.str.exp_stochastic_rastrigin.74 = private unnamed_addr constant [15 x i8] c"  Amp     Loss\00"
@.str.exp_stochastic_rastrigin.75 = private unnamed_addr constant [17 x i8] c"  ------  ------\00"
@.str.exp_stochastic_rastrigin.76 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.77 = private unnamed_addr constant [9 x i8] c"999999.0\00"
@.str.exp_stochastic_rastrigin.78 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.79 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_stochastic_rastrigin.80 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_stochastic_rastrigin.81 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_stochastic_rastrigin.82 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.83 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.84 = private unnamed_addr constant [13 x i8] c"  Best: amp=\00"
@.str.exp_stochastic_rastrigin.85 = private unnamed_addr constant [7 x i8] c" loss=\00"
@.str.exp_stochastic_rastrigin.86 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.87 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.88 = private unnamed_addr constant [33 x i8] c"--- Learning noise amplitude ---\00"
@.str.exp_stochastic_rastrigin.89 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stochastic_rastrigin.90 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_stochastic_rastrigin.91 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_stochastic_rastrigin.92 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.95 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.96 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stochastic_rastrigin.97 = private unnamed_addr constant [9 x i8] c"  cycle \00"
@.str.exp_stochastic_rastrigin.98 = private unnamed_addr constant [7 x i8] c": amp=\00"
@.str.exp_stochastic_rastrigin.99 = private unnamed_addr constant [7 x i8] c" grad=\00"
@.str.exp_stochastic_rastrigin.100 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.101 = private unnamed_addr constant [17 x i8] c"  cycle 19: amp=\00"
@.str.exp_stochastic_rastrigin.102 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.103 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stochastic_rastrigin.104 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.105 = private unnamed_addr constant [27 x i8] c"  Deterministic (amp=0):  \00"
@.str.exp_stochastic_rastrigin.106 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.107 = private unnamed_addr constant [16 x i8] c"  Learned (amp=\00"
@.str.exp_stochastic_rastrigin.108 = private unnamed_addr constant [5 x i8] c"):  \00"
@.str.exp_stochastic_rastrigin.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.110 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.111 = private unnamed_addr constant [57 x i8] c"  PASS: Stochastic noise IMPROVES multimodal convergence\00"
@.str.exp_stochastic_rastrigin.112 = private unnamed_addr constant [59 x i8] c"  The noise amplitude is a learnable dual-number parameter\00"
@.str.exp_stochastic_rastrigin.113 = private unnamed_addr constant [53 x i8] c"  — a sixth level in the differentiable hierarchy.\00"
@.str.exp_stochastic_rastrigin.114 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stochastic_rastrigin.115 = private unnamed_addr constant [39 x i8] c"  Noise did not help on this landscape\00"
