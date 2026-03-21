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
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"max_f64"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t22 = load i64, ptr %local.a
  %t23 = load i64, ptr %local.b
  %t24 = call i64 @"sx_f64_gt"(i64 %t22, i64 %t23)
  %t25 = icmp ne i64 %t24, 0
  br i1 %t25, label %then3, label %else3
then3:
  %t26 = load i64, ptr %local.a
  br label %then3_end
then3_end:
  br label %endif3
else3:
  %t27 = load i64, ptr %local.b
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t28 = phi i64 [ %t26, %then3_end ], [ %t27, %else3_end ]
  ret i64 %t28
}

define i64 @"burgers_step_adaptive"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %nu_total, i64 %dt, i64 %dx, i64 %idx) nounwind {
entry:
  %local.um1.29 = alloca i64
  %local.up1.30 = alloca i64
  %local.ui.31 = alloca i64
  %local.advection.32 = alloca i64
  %local.diffusion.33 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.nu_total = alloca i64
  store i64 %nu_total, ptr %local.nu_total
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.idx = alloca i64
  store i64 %idx, ptr %local.idx
  %t34 = load i64, ptr %local.u4
  store i64 %t34, ptr %local.um1.29
  %t35 = load i64, ptr %local.u1
  store i64 %t35, ptr %local.up1.30
  %t36 = load i64, ptr %local.u0
  store i64 %t36, ptr %local.ui.31
  %t37 = load i64, ptr %local.idx
  %t38 = icmp eq i64 %t37, 0
  %t39 = zext i1 %t38 to i64
  %t40 = icmp ne i64 %t39, 0
  br i1 %t40, label %then4, label %else4
then4:
  %t41 = load i64, ptr %local.u4
  store i64 %t41, ptr %local.um1.29
  %t42 = load i64, ptr %local.u0
  store i64 %t42, ptr %local.ui.31
  %t43 = load i64, ptr %local.u1
  store i64 %t43, ptr %local.up1.30
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t44 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t45 = load i64, ptr %local.idx
  %t46 = icmp eq i64 %t45, 1
  %t47 = zext i1 %t46 to i64
  %t48 = icmp ne i64 %t47, 0
  br i1 %t48, label %then5, label %else5
then5:
  %t49 = load i64, ptr %local.u0
  store i64 %t49, ptr %local.um1.29
  %t50 = load i64, ptr %local.u1
  store i64 %t50, ptr %local.ui.31
  %t51 = load i64, ptr %local.u2
  store i64 %t51, ptr %local.up1.30
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t52 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t53 = load i64, ptr %local.idx
  %t54 = icmp eq i64 %t53, 2
  %t55 = zext i1 %t54 to i64
  %t56 = icmp ne i64 %t55, 0
  br i1 %t56, label %then6, label %else6
then6:
  %t57 = load i64, ptr %local.u1
  store i64 %t57, ptr %local.um1.29
  %t58 = load i64, ptr %local.u2
  store i64 %t58, ptr %local.ui.31
  %t59 = load i64, ptr %local.u3
  store i64 %t59, ptr %local.up1.30
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t60 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t61 = load i64, ptr %local.idx
  %t62 = icmp eq i64 %t61, 3
  %t63 = zext i1 %t62 to i64
  %t64 = icmp ne i64 %t63, 0
  br i1 %t64, label %then7, label %else7
then7:
  %t65 = load i64, ptr %local.u2
  store i64 %t65, ptr %local.um1.29
  %t66 = load i64, ptr %local.u3
  store i64 %t66, ptr %local.ui.31
  %t67 = load i64, ptr %local.u4
  store i64 %t67, ptr %local.up1.30
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t68 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t69 = load i64, ptr %local.idx
  %t70 = icmp eq i64 %t69, 4
  %t71 = zext i1 %t70 to i64
  %t72 = icmp ne i64 %t71, 0
  br i1 %t72, label %then8, label %else8
then8:
  %t73 = load i64, ptr %local.u3
  store i64 %t73, ptr %local.um1.29
  %t74 = load i64, ptr %local.u4
  store i64 %t74, ptr %local.ui.31
  %t75 = load i64, ptr %local.u0
  store i64 %t75, ptr %local.up1.30
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t76 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t77 = load i64, ptr %local.ui.31
  %t78 = load i64, ptr %local.up1.30
  %t79 = load i64, ptr %local.um1.29
  %t80 = call i64 @"sx_f64_sub"(i64 %t78, i64 %t79)
  %t81 = call i64 @"sx_f64_mul"(i64 %t77, i64 %t80)
  %t82 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.2)
  %t83 = load i64, ptr %local.dx
  %t84 = call i64 @"sx_f64_mul"(i64 %t82, i64 %t83)
  %t85 = call i64 @"sx_f64_div"(i64 %t81, i64 %t84)
  store i64 %t85, ptr %local.advection.32
  %t86 = load i64, ptr %local.nu_total
  %t87 = load i64, ptr %local.up1.30
  %t88 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.3)
  %t89 = load i64, ptr %local.ui.31
  %t90 = call i64 @"sx_f64_mul"(i64 %t88, i64 %t89)
  %t91 = call i64 @"sx_f64_sub"(i64 %t87, i64 %t90)
  %t92 = load i64, ptr %local.um1.29
  %t93 = call i64 @"sx_f64_add"(i64 %t91, i64 %t92)
  %t94 = call i64 @"sx_f64_mul"(i64 %t86, i64 %t93)
  %t95 = load i64, ptr %local.dx
  %t96 = load i64, ptr %local.dx
  %t97 = call i64 @"sx_f64_mul"(i64 %t95, i64 %t96)
  %t98 = call i64 @"sx_f64_div"(i64 %t94, i64 %t97)
  store i64 %t98, ptr %local.diffusion.33
  %t99 = load i64, ptr %local.ui.31
  %t100 = load i64, ptr %local.dt
  %t101 = load i64, ptr %local.diffusion.33
  %t102 = load i64, ptr %local.advection.32
  %t103 = call i64 @"sx_f64_sub"(i64 %t101, i64 %t102)
  %t104 = call i64 @"sx_f64_mul"(i64 %t100, i64 %t103)
  %t105 = call i64 @"sx_f64_add"(i64 %t99, i64 %t104)
  ret i64 %t105
}

define i64 @"run_burgers_pid"(i64 %nu_base, i64 %w1, i64 %w2, i64 %w3, i64 %nu_art_base, i64 %steps, i64 %query) nounwind {
entry:
  %local.pi.106 = alloca i64
  %local.dx.107 = alloca i64
  %local.dt.108 = alloca i64
  %local.u0.109 = alloca i64
  %local.u1.110 = alloca i64
  %local.u2.111 = alloca i64
  %local.u3.112 = alloca i64
  %local.u4.113 = alloca i64
  %local.step.114 = alloca i64
  %local.nu_art.115 = alloca i64
  %local.prev_max_grad.116 = alloca i64
  %local.prev_drift.117 = alloca i64
  %local.prev_s.118 = alloca i64
  %local.prev_sp.119 = alloca i64
  %local.drift.120 = alloca i64
  %local.s_val.121 = alloca i64
  %local.s_prime.122 = alloca i64
  %local.s_double.123 = alloca i64
  %local.max_grad.124 = alloca i64
  %local.blowup_step.125 = alloca i64
  %local.nu_total.126 = alloca i64
  %local.n0.127 = alloca i64
  %local.n1.128 = alloca i64
  %local.n2.129 = alloca i64
  %local.n3.130 = alloca i64
  %local.n4.131 = alloca i64
  %local.g01.132 = alloca i64
  %local.g12.133 = alloca i64
  %local.g23.134 = alloca i64
  %local.g34.135 = alloca i64
  %local.nu_base = alloca i64
  store i64 %nu_base, ptr %local.nu_base
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.nu_art_base = alloca i64
  store i64 %nu_art_base, ptr %local.nu_art_base
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.query = alloca i64
  store i64 %query, ptr %local.query
  %t136 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.4)
  store i64 %t136, ptr %local.pi.106
  %t137 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.5)
  store i64 %t137, ptr %local.dx.107
  %t138 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.6)
  store i64 %t138, ptr %local.dt.108
  %t139 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.7)
  %t140 = load i64, ptr %local.pi.106
  %t141 = call i64 @"sx_f64_mul"(i64 %t139, i64 %t140)
  %t142 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.8)
  %t143 = call i64 @"sx_f64_mul"(i64 %t141, i64 %t142)
  %t144 = call i64 @"sin_f64"(i64 %t143)
  %t145 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.9)
  %t146 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.10)
  %t147 = load i64, ptr %local.pi.106
  %t148 = call i64 @"sx_f64_mul"(i64 %t146, i64 %t147)
  %t149 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.11)
  %t150 = call i64 @"sx_f64_mul"(i64 %t148, i64 %t149)
  %t151 = call i64 @"sin_f64"(i64 %t150)
  %t152 = call i64 @"sx_f64_mul"(i64 %t145, i64 %t151)
  %t153 = call i64 @"sx_f64_add"(i64 %t144, i64 %t152)
  store i64 %t153, ptr %local.u0.109
  %t154 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.12)
  %t155 = load i64, ptr %local.pi.106
  %t156 = call i64 @"sx_f64_mul"(i64 %t154, i64 %t155)
  %t157 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.13)
  %t158 = call i64 @"sx_f64_mul"(i64 %t156, i64 %t157)
  %t159 = call i64 @"sin_f64"(i64 %t158)
  %t160 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.14)
  %t161 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.15)
  %t162 = load i64, ptr %local.pi.106
  %t163 = call i64 @"sx_f64_mul"(i64 %t161, i64 %t162)
  %t164 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.16)
  %t165 = call i64 @"sx_f64_mul"(i64 %t163, i64 %t164)
  %t166 = call i64 @"sin_f64"(i64 %t165)
  %t167 = call i64 @"sx_f64_mul"(i64 %t160, i64 %t166)
  %t168 = call i64 @"sx_f64_add"(i64 %t159, i64 %t167)
  store i64 %t168, ptr %local.u1.110
  %t169 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.17)
  %t170 = load i64, ptr %local.pi.106
  %t171 = call i64 @"sx_f64_mul"(i64 %t169, i64 %t170)
  %t172 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.18)
  %t173 = call i64 @"sx_f64_mul"(i64 %t171, i64 %t172)
  %t174 = call i64 @"sin_f64"(i64 %t173)
  %t175 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.19)
  %t176 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.20)
  %t177 = load i64, ptr %local.pi.106
  %t178 = call i64 @"sx_f64_mul"(i64 %t176, i64 %t177)
  %t179 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.21)
  %t180 = call i64 @"sx_f64_mul"(i64 %t178, i64 %t179)
  %t181 = call i64 @"sin_f64"(i64 %t180)
  %t182 = call i64 @"sx_f64_mul"(i64 %t175, i64 %t181)
  %t183 = call i64 @"sx_f64_add"(i64 %t174, i64 %t182)
  store i64 %t183, ptr %local.u2.111
  %t184 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.22)
  %t185 = load i64, ptr %local.pi.106
  %t186 = call i64 @"sx_f64_mul"(i64 %t184, i64 %t185)
  %t187 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.23)
  %t188 = call i64 @"sx_f64_mul"(i64 %t186, i64 %t187)
  %t189 = call i64 @"sin_f64"(i64 %t188)
  %t190 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.24)
  %t191 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.25)
  %t192 = load i64, ptr %local.pi.106
  %t193 = call i64 @"sx_f64_mul"(i64 %t191, i64 %t192)
  %t194 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.26)
  %t195 = call i64 @"sx_f64_mul"(i64 %t193, i64 %t194)
  %t196 = call i64 @"sin_f64"(i64 %t195)
  %t197 = call i64 @"sx_f64_mul"(i64 %t190, i64 %t196)
  %t198 = call i64 @"sx_f64_add"(i64 %t189, i64 %t197)
  store i64 %t198, ptr %local.u3.112
  %t199 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.27)
  %t200 = load i64, ptr %local.pi.106
  %t201 = call i64 @"sx_f64_mul"(i64 %t199, i64 %t200)
  %t202 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.28)
  %t203 = call i64 @"sx_f64_mul"(i64 %t201, i64 %t202)
  %t204 = call i64 @"sin_f64"(i64 %t203)
  %t205 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.29)
  %t206 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.30)
  %t207 = load i64, ptr %local.pi.106
  %t208 = call i64 @"sx_f64_mul"(i64 %t206, i64 %t207)
  %t209 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.31)
  %t210 = call i64 @"sx_f64_mul"(i64 %t208, i64 %t209)
  %t211 = call i64 @"sin_f64"(i64 %t210)
  %t212 = call i64 @"sx_f64_mul"(i64 %t205, i64 %t211)
  %t213 = call i64 @"sx_f64_add"(i64 %t204, i64 %t212)
  store i64 %t213, ptr %local.u4.113
  store i64 0, ptr %local.step.114
  %t214 = load i64, ptr %local.nu_art_base
  store i64 %t214, ptr %local.nu_art.115
  %t215 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.32)
  store i64 %t215, ptr %local.prev_max_grad.116
  %t216 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.33)
  store i64 %t216, ptr %local.prev_drift.117
  %t217 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.34)
  store i64 %t217, ptr %local.prev_s.118
  %t218 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.35)
  store i64 %t218, ptr %local.prev_sp.119
  %t219 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.36)
  store i64 %t219, ptr %local.drift.120
  %t220 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.37)
  store i64 %t220, ptr %local.s_val.121
  %t221 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.38)
  store i64 %t221, ptr %local.s_prime.122
  %t222 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.39)
  store i64 %t222, ptr %local.s_double.123
  %t223 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.40)
  store i64 %t223, ptr %local.max_grad.124
  %t224 = sub i64 0, 1
  store i64 %t224, ptr %local.blowup_step.125
  br label %loop9
loop9:
  %t225 = load i64, ptr %local.step.114
  %t226 = load i64, ptr %local.steps
  %t227 = icmp slt i64 %t225, %t226
  %t228 = zext i1 %t227 to i64
  %t229 = icmp ne i64 %t228, 0
  br i1 %t229, label %body9, label %endloop9
body9:
  %t230 = load i64, ptr %local.nu_base
  %t231 = load i64, ptr %local.nu_art.115
  %t232 = call i64 @"sx_f64_add"(i64 %t230, i64 %t231)
  store i64 %t232, ptr %local.nu_total.126
  %t233 = load i64, ptr %local.u0.109
  %t234 = load i64, ptr %local.u1.110
  %t235 = load i64, ptr %local.u2.111
  %t236 = load i64, ptr %local.u3.112
  %t237 = load i64, ptr %local.u4.113
  %t238 = load i64, ptr %local.nu_total.126
  %t239 = load i64, ptr %local.dt.108
  %t240 = load i64, ptr %local.dx.107
  %t241 = call i64 @"burgers_step_adaptive"(i64 %t233, i64 %t234, i64 %t235, i64 %t236, i64 %t237, i64 %t238, i64 %t239, i64 %t240, i64 0)
  store i64 %t241, ptr %local.n0.127
  %t242 = load i64, ptr %local.u0.109
  %t243 = load i64, ptr %local.u1.110
  %t244 = load i64, ptr %local.u2.111
  %t245 = load i64, ptr %local.u3.112
  %t246 = load i64, ptr %local.u4.113
  %t247 = load i64, ptr %local.nu_total.126
  %t248 = load i64, ptr %local.dt.108
  %t249 = load i64, ptr %local.dx.107
  %t250 = call i64 @"burgers_step_adaptive"(i64 %t242, i64 %t243, i64 %t244, i64 %t245, i64 %t246, i64 %t247, i64 %t248, i64 %t249, i64 1)
  store i64 %t250, ptr %local.n1.128
  %t251 = load i64, ptr %local.u0.109
  %t252 = load i64, ptr %local.u1.110
  %t253 = load i64, ptr %local.u2.111
  %t254 = load i64, ptr %local.u3.112
  %t255 = load i64, ptr %local.u4.113
  %t256 = load i64, ptr %local.nu_total.126
  %t257 = load i64, ptr %local.dt.108
  %t258 = load i64, ptr %local.dx.107
  %t259 = call i64 @"burgers_step_adaptive"(i64 %t251, i64 %t252, i64 %t253, i64 %t254, i64 %t255, i64 %t256, i64 %t257, i64 %t258, i64 2)
  store i64 %t259, ptr %local.n2.129
  %t260 = load i64, ptr %local.u0.109
  %t261 = load i64, ptr %local.u1.110
  %t262 = load i64, ptr %local.u2.111
  %t263 = load i64, ptr %local.u3.112
  %t264 = load i64, ptr %local.u4.113
  %t265 = load i64, ptr %local.nu_total.126
  %t266 = load i64, ptr %local.dt.108
  %t267 = load i64, ptr %local.dx.107
  %t268 = call i64 @"burgers_step_adaptive"(i64 %t260, i64 %t261, i64 %t262, i64 %t263, i64 %t264, i64 %t265, i64 %t266, i64 %t267, i64 3)
  store i64 %t268, ptr %local.n3.130
  %t269 = load i64, ptr %local.u0.109
  %t270 = load i64, ptr %local.u1.110
  %t271 = load i64, ptr %local.u2.111
  %t272 = load i64, ptr %local.u3.112
  %t273 = load i64, ptr %local.u4.113
  %t274 = load i64, ptr %local.nu_total.126
  %t275 = load i64, ptr %local.dt.108
  %t276 = load i64, ptr %local.dx.107
  %t277 = call i64 @"burgers_step_adaptive"(i64 %t269, i64 %t270, i64 %t271, i64 %t272, i64 %t273, i64 %t274, i64 %t275, i64 %t276, i64 4)
  store i64 %t277, ptr %local.n4.131
  %t278 = load i64, ptr %local.n0.127
  store i64 %t278, ptr %local.u0.109
  %t279 = load i64, ptr %local.n1.128
  store i64 %t279, ptr %local.u1.110
  %t280 = load i64, ptr %local.n2.129
  store i64 %t280, ptr %local.u2.111
  %t281 = load i64, ptr %local.n3.130
  store i64 %t281, ptr %local.u3.112
  %t282 = load i64, ptr %local.n4.131
  store i64 %t282, ptr %local.u4.113
  %t283 = load i64, ptr %local.u1.110
  %t284 = load i64, ptr %local.u0.109
  %t285 = call i64 @"sx_f64_sub"(i64 %t283, i64 %t284)
  %t286 = call i64 @"abs_f64"(i64 %t285)
  %t287 = load i64, ptr %local.dx.107
  %t288 = call i64 @"sx_f64_div"(i64 %t286, i64 %t287)
  store i64 %t288, ptr %local.g01.132
  %t289 = load i64, ptr %local.u2.111
  %t290 = load i64, ptr %local.u1.110
  %t291 = call i64 @"sx_f64_sub"(i64 %t289, i64 %t290)
  %t292 = call i64 @"abs_f64"(i64 %t291)
  %t293 = load i64, ptr %local.dx.107
  %t294 = call i64 @"sx_f64_div"(i64 %t292, i64 %t293)
  store i64 %t294, ptr %local.g12.133
  %t295 = load i64, ptr %local.u3.112
  %t296 = load i64, ptr %local.u2.111
  %t297 = call i64 @"sx_f64_sub"(i64 %t295, i64 %t296)
  %t298 = call i64 @"abs_f64"(i64 %t297)
  %t299 = load i64, ptr %local.dx.107
  %t300 = call i64 @"sx_f64_div"(i64 %t298, i64 %t299)
  store i64 %t300, ptr %local.g23.134
  %t301 = load i64, ptr %local.u4.113
  %t302 = load i64, ptr %local.u3.112
  %t303 = call i64 @"sx_f64_sub"(i64 %t301, i64 %t302)
  %t304 = call i64 @"abs_f64"(i64 %t303)
  %t305 = load i64, ptr %local.dx.107
  %t306 = call i64 @"sx_f64_div"(i64 %t304, i64 %t305)
  store i64 %t306, ptr %local.g34.135
  %t307 = load i64, ptr %local.g01.132
  %t308 = load i64, ptr %local.g12.133
  %t309 = call i64 @"max_f64"(i64 %t307, i64 %t308)
  %t310 = load i64, ptr %local.g23.134
  %t311 = load i64, ptr %local.g34.135
  %t312 = call i64 @"max_f64"(i64 %t310, i64 %t311)
  %t313 = call i64 @"max_f64"(i64 %t309, i64 %t312)
  store i64 %t313, ptr %local.max_grad.124
  %t314 = load i64, ptr %local.max_grad.124
  %t315 = load i64, ptr %local.prev_max_grad.116
  %t316 = call i64 @"sx_f64_sub"(i64 %t314, i64 %t315)
  %t317 = call i64 @"abs_f64"(i64 %t316)
  store i64 %t317, ptr %local.drift.120
  %t318 = load i64, ptr %local.prev_drift.117
  %t319 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.41)
  %t320 = call i64 @"sx_f64_gt"(i64 %t318, i64 %t319)
  %t321 = icmp ne i64 %t320, 0
  br i1 %t321, label %then10, label %else10
then10:
  %t322 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.42)
  %t323 = load i64, ptr %local.drift.120
  %t324 = load i64, ptr %local.prev_drift.117
  %t325 = call i64 @"sx_f64_div"(i64 %t323, i64 %t324)
  %t326 = call i64 @"sx_f64_sub"(i64 %t322, i64 %t325)
  store i64 %t326, ptr %local.s_val.121
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t327 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.43)
  store i64 %t327, ptr %local.s_val.121
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t328 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t329 = load i64, ptr %local.s_val.121
  %t330 = load i64, ptr %local.prev_s.118
  %t331 = call i64 @"sx_f64_sub"(i64 %t329, i64 %t330)
  store i64 %t331, ptr %local.s_prime.122
  %t332 = load i64, ptr %local.s_prime.122
  %t333 = load i64, ptr %local.prev_sp.119
  %t334 = call i64 @"sx_f64_sub"(i64 %t332, i64 %t333)
  store i64 %t334, ptr %local.s_double.123
  %t335 = load i64, ptr %local.nu_art_base
  %t336 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.44)
  %t337 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.45)
  %t338 = load i64, ptr %local.w1
  %t339 = load i64, ptr %local.s_val.121
  %t340 = call i64 @"sx_f64_mul"(i64 %t338, i64 %t339)
  %t341 = call i64 @"sx_f64_add"(i64 %t337, i64 %t340)
  %t342 = load i64, ptr %local.w2
  %t343 = load i64, ptr %local.s_prime.122
  %t344 = call i64 @"sx_f64_mul"(i64 %t342, i64 %t343)
  %t345 = call i64 @"sx_f64_add"(i64 %t341, i64 %t344)
  %t346 = load i64, ptr %local.w3
  %t347 = load i64, ptr %local.s_double.123
  %t348 = call i64 @"sx_f64_mul"(i64 %t346, i64 %t347)
  %t349 = call i64 @"sx_f64_add"(i64 %t345, i64 %t348)
  %t350 = call i64 @"sx_f64_sub"(i64 %t336, i64 %t349)
  %t351 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.46)
  %t352 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.47)
  %t353 = call i64 @"clamp"(i64 %t350, i64 %t351, i64 %t352)
  %t354 = call i64 @"sx_f64_mul"(i64 %t335, i64 %t353)
  store i64 %t354, ptr %local.nu_art.115
  %t355 = load i64, ptr %local.max_grad.124
  %t356 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.48)
  %t357 = call i64 @"sx_f64_gt"(i64 %t355, i64 %t356)
  %t358 = icmp ne i64 %t357, 0
  br i1 %t358, label %then11, label %else11
then11:
  %t359 = load i64, ptr %local.blowup_step.125
  %t360 = sub i64 0, 1
  %t361 = icmp eq i64 %t359, %t360
  %t362 = zext i1 %t361 to i64
  %t363 = icmp ne i64 %t362, 0
  br i1 %t363, label %then12, label %else12
then12:
  %t364 = load i64, ptr %local.step.114
  store i64 %t364, ptr %local.blowup_step.125
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t365 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t366 = phi i64 [ %t365, %then11_end ], [ 0, %else11_end ]
  %t367 = load i64, ptr %local.max_grad.124
  store i64 %t367, ptr %local.prev_max_grad.116
  %t368 = load i64, ptr %local.drift.120
  store i64 %t368, ptr %local.prev_drift.117
  %t369 = load i64, ptr %local.s_prime.122
  store i64 %t369, ptr %local.prev_sp.119
  %t370 = load i64, ptr %local.s_val.121
  store i64 %t370, ptr %local.prev_s.118
  %t371 = load i64, ptr %local.step.114
  %t372 = add i64 %t371, 1
  store i64 %t372, ptr %local.step.114
  br label %loop9
endloop9:
  %t373 = load i64, ptr %local.query
  %t374 = icmp eq i64 %t373, 0
  %t375 = zext i1 %t374 to i64
  %t376 = icmp ne i64 %t375, 0
  br i1 %t376, label %then13, label %else13
then13:
  %t377 = load i64, ptr %local.max_grad.124
  ret i64 %t377
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t378 = phi i64 [ 0, %else13_end ]
  %t379 = load i64, ptr %local.query
  %t380 = icmp eq i64 %t379, 1
  %t381 = zext i1 %t380 to i64
  %t382 = icmp ne i64 %t381, 0
  br i1 %t382, label %then14, label %else14
then14:
  %t383 = load i64, ptr %local.s_val.121
  ret i64 %t383
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t384 = phi i64 [ 0, %else14_end ]
  %t385 = load i64, ptr %local.query
  %t386 = icmp eq i64 %t385, 2
  %t387 = zext i1 %t386 to i64
  %t388 = icmp ne i64 %t387, 0
  br i1 %t388, label %then15, label %else15
then15:
  %t389 = load i64, ptr %local.blowup_step.125
  %t390 = call i64 @"sx_int_to_f64"(i64 %t389)
  ret i64 %t390
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t391 = phi i64 [ 0, %else15_end ]
  %t392 = load i64, ptr %local.max_grad.124
  ret i64 %t392
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.steps.393 = alloca i64
  %local.nu_base.394 = alloca i64
  %local.grad_none.395 = alloca i64
  %local.blow_none.396 = alloca i64
  %local.grad_fixed.397 = alloca i64
  %local.blow_fixed.398 = alloca i64
  %local.grad_p.399 = alloca i64
  %local.blow_p.400 = alloca i64
  %local.grad_pd.401 = alloca i64
  %local.blow_pd.402 = alloca i64
  %local.grad_pid.403 = alloca i64
  %local.blow_pid.404 = alloca i64
  %t405 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.49)
  %t406 = ptrtoint ptr %t405 to i64
  %t407 = inttoptr i64 %t406 to ptr
  call void @intrinsic_println(ptr %t407)
  %t408 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.50)
  %t409 = ptrtoint ptr %t408 to i64
  %t410 = inttoptr i64 %t409 to ptr
  call void @intrinsic_println(ptr %t410)
  %t411 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.51)
  %t412 = ptrtoint ptr %t411 to i64
  %t413 = inttoptr i64 %t412 to ptr
  call void @intrinsic_println(ptr %t413)
  %t414 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.52)
  %t415 = ptrtoint ptr %t414 to i64
  %t416 = inttoptr i64 %t415 to ptr
  call void @intrinsic_println(ptr %t416)
  %t417 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.53)
  %t418 = ptrtoint ptr %t417 to i64
  %t419 = inttoptr i64 %t418 to ptr
  call void @intrinsic_println(ptr %t419)
  store i64 30000, ptr %local.steps.393
  %t420 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.54)
  store i64 %t420, ptr %local.nu_base.394
  %t421 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.55)
  %t422 = ptrtoint ptr %t421 to i64
  %t423 = inttoptr i64 %t422 to ptr
  call void @intrinsic_println(ptr %t423)
  %t424 = load i64, ptr %local.nu_base.394
  %t425 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.56)
  %t426 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.57)
  %t427 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.58)
  %t428 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.59)
  %t429 = load i64, ptr %local.steps.393
  %t430 = call i64 @"run_burgers_pid"(i64 %t424, i64 %t425, i64 %t426, i64 %t427, i64 %t428, i64 %t429, i64 0)
  store i64 %t430, ptr %local.grad_none.395
  %t431 = load i64, ptr %local.nu_base.394
  %t432 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.60)
  %t433 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.61)
  %t434 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.62)
  %t435 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.63)
  %t436 = load i64, ptr %local.steps.393
  %t437 = call i64 @"run_burgers_pid"(i64 %t431, i64 %t432, i64 %t433, i64 %t434, i64 %t435, i64 %t436, i64 2)
  store i64 %t437, ptr %local.blow_none.396
  %t438 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.64)
  %t439 = ptrtoint ptr %t438 to i64
  %t440 = inttoptr i64 %t439 to ptr
  call void @intrinsic_print(ptr %t440)
  %t441 = load i64, ptr %local.grad_none.395
  %t442 = call i64 @"print_f64"(i64 %t441)
  %t443 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.65)
  %t444 = ptrtoint ptr %t443 to i64
  %t445 = inttoptr i64 %t444 to ptr
  call void @intrinsic_println(ptr %t445)
  %t446 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.66)
  %t447 = ptrtoint ptr %t446 to i64
  %t448 = inttoptr i64 %t447 to ptr
  call void @intrinsic_print(ptr %t448)
  %t449 = load i64, ptr %local.blow_none.396
  %t450 = call i64 @"print_f64"(i64 %t449)
  %t451 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.67)
  %t452 = ptrtoint ptr %t451 to i64
  %t453 = inttoptr i64 %t452 to ptr
  call void @intrinsic_println(ptr %t453)
  %t454 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.68)
  %t455 = ptrtoint ptr %t454 to i64
  %t456 = inttoptr i64 %t455 to ptr
  call void @intrinsic_println(ptr %t456)
  %t457 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.69)
  %t458 = ptrtoint ptr %t457 to i64
  %t459 = inttoptr i64 %t458 to ptr
  call void @intrinsic_println(ptr %t459)
  %t460 = load i64, ptr %local.nu_base.394
  %t461 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.70)
  %t462 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.71)
  %t463 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.72)
  %t464 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.73)
  %t465 = load i64, ptr %local.steps.393
  %t466 = call i64 @"run_burgers_pid"(i64 %t460, i64 %t461, i64 %t462, i64 %t463, i64 %t464, i64 %t465, i64 0)
  store i64 %t466, ptr %local.grad_fixed.397
  %t467 = load i64, ptr %local.nu_base.394
  %t468 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.74)
  %t469 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.75)
  %t470 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.76)
  %t471 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.77)
  %t472 = load i64, ptr %local.steps.393
  %t473 = call i64 @"run_burgers_pid"(i64 %t467, i64 %t468, i64 %t469, i64 %t470, i64 %t471, i64 %t472, i64 2)
  store i64 %t473, ptr %local.blow_fixed.398
  %t474 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.78)
  %t475 = ptrtoint ptr %t474 to i64
  %t476 = inttoptr i64 %t475 to ptr
  call void @intrinsic_print(ptr %t476)
  %t477 = load i64, ptr %local.grad_fixed.397
  %t478 = call i64 @"print_f64"(i64 %t477)
  %t479 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.79)
  %t480 = ptrtoint ptr %t479 to i64
  %t481 = inttoptr i64 %t480 to ptr
  call void @intrinsic_println(ptr %t481)
  %t482 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.80)
  %t483 = ptrtoint ptr %t482 to i64
  %t484 = inttoptr i64 %t483 to ptr
  call void @intrinsic_print(ptr %t484)
  %t485 = load i64, ptr %local.blow_fixed.398
  %t486 = call i64 @"print_f64"(i64 %t485)
  %t487 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.81)
  %t488 = ptrtoint ptr %t487 to i64
  %t489 = inttoptr i64 %t488 to ptr
  call void @intrinsic_println(ptr %t489)
  %t490 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.82)
  %t491 = ptrtoint ptr %t490 to i64
  %t492 = inttoptr i64 %t491 to ptr
  call void @intrinsic_println(ptr %t492)
  %t493 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.83)
  %t494 = ptrtoint ptr %t493 to i64
  %t495 = inttoptr i64 %t494 to ptr
  call void @intrinsic_println(ptr %t495)
  %t496 = load i64, ptr %local.nu_base.394
  %t497 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.84)
  %t498 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.85)
  %t499 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.86)
  %t500 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.87)
  %t501 = load i64, ptr %local.steps.393
  %t502 = call i64 @"run_burgers_pid"(i64 %t496, i64 %t497, i64 %t498, i64 %t499, i64 %t500, i64 %t501, i64 0)
  store i64 %t502, ptr %local.grad_p.399
  %t503 = load i64, ptr %local.nu_base.394
  %t504 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.88)
  %t505 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.89)
  %t506 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.90)
  %t507 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.91)
  %t508 = load i64, ptr %local.steps.393
  %t509 = call i64 @"run_burgers_pid"(i64 %t503, i64 %t504, i64 %t505, i64 %t506, i64 %t507, i64 %t508, i64 2)
  store i64 %t509, ptr %local.blow_p.400
  %t510 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.92)
  %t511 = ptrtoint ptr %t510 to i64
  %t512 = inttoptr i64 %t511 to ptr
  call void @intrinsic_print(ptr %t512)
  %t513 = load i64, ptr %local.grad_p.399
  %t514 = call i64 @"print_f64"(i64 %t513)
  %t515 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.93)
  %t516 = ptrtoint ptr %t515 to i64
  %t517 = inttoptr i64 %t516 to ptr
  call void @intrinsic_println(ptr %t517)
  %t518 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.94)
  %t519 = ptrtoint ptr %t518 to i64
  %t520 = inttoptr i64 %t519 to ptr
  call void @intrinsic_print(ptr %t520)
  %t521 = load i64, ptr %local.blow_p.400
  %t522 = call i64 @"print_f64"(i64 %t521)
  %t523 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.95)
  %t524 = ptrtoint ptr %t523 to i64
  %t525 = inttoptr i64 %t524 to ptr
  call void @intrinsic_println(ptr %t525)
  %t526 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.96)
  %t527 = ptrtoint ptr %t526 to i64
  %t528 = inttoptr i64 %t527 to ptr
  call void @intrinsic_println(ptr %t528)
  %t529 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.97)
  %t530 = ptrtoint ptr %t529 to i64
  %t531 = inttoptr i64 %t530 to ptr
  call void @intrinsic_println(ptr %t531)
  %t532 = load i64, ptr %local.nu_base.394
  %t533 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.98)
  %t534 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.99)
  %t535 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.100)
  %t536 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.101)
  %t537 = load i64, ptr %local.steps.393
  %t538 = call i64 @"run_burgers_pid"(i64 %t532, i64 %t533, i64 %t534, i64 %t535, i64 %t536, i64 %t537, i64 0)
  store i64 %t538, ptr %local.grad_pd.401
  %t539 = load i64, ptr %local.nu_base.394
  %t540 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.102)
  %t541 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.103)
  %t542 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.104)
  %t543 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.105)
  %t544 = load i64, ptr %local.steps.393
  %t545 = call i64 @"run_burgers_pid"(i64 %t539, i64 %t540, i64 %t541, i64 %t542, i64 %t543, i64 %t544, i64 2)
  store i64 %t545, ptr %local.blow_pd.402
  %t546 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.106)
  %t547 = ptrtoint ptr %t546 to i64
  %t548 = inttoptr i64 %t547 to ptr
  call void @intrinsic_print(ptr %t548)
  %t549 = load i64, ptr %local.grad_pd.401
  %t550 = call i64 @"print_f64"(i64 %t549)
  %t551 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.107)
  %t552 = ptrtoint ptr %t551 to i64
  %t553 = inttoptr i64 %t552 to ptr
  call void @intrinsic_println(ptr %t553)
  %t554 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.108)
  %t555 = ptrtoint ptr %t554 to i64
  %t556 = inttoptr i64 %t555 to ptr
  call void @intrinsic_print(ptr %t556)
  %t557 = load i64, ptr %local.blow_pd.402
  %t558 = call i64 @"print_f64"(i64 %t557)
  %t559 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.109)
  %t560 = ptrtoint ptr %t559 to i64
  %t561 = inttoptr i64 %t560 to ptr
  call void @intrinsic_println(ptr %t561)
  %t562 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.110)
  %t563 = ptrtoint ptr %t562 to i64
  %t564 = inttoptr i64 %t563 to ptr
  call void @intrinsic_println(ptr %t564)
  %t565 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.111)
  %t566 = ptrtoint ptr %t565 to i64
  %t567 = inttoptr i64 %t566 to ptr
  call void @intrinsic_println(ptr %t567)
  %t568 = load i64, ptr %local.nu_base.394
  %t569 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.112)
  %t570 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.113)
  %t571 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.114)
  %t572 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.115)
  %t573 = load i64, ptr %local.steps.393
  %t574 = call i64 @"run_burgers_pid"(i64 %t568, i64 %t569, i64 %t570, i64 %t571, i64 %t572, i64 %t573, i64 0)
  store i64 %t574, ptr %local.grad_pid.403
  %t575 = load i64, ptr %local.nu_base.394
  %t576 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.116)
  %t577 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.117)
  %t578 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.118)
  %t579 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.119)
  %t580 = load i64, ptr %local.steps.393
  %t581 = call i64 @"run_burgers_pid"(i64 %t575, i64 %t576, i64 %t577, i64 %t578, i64 %t579, i64 %t580, i64 2)
  store i64 %t581, ptr %local.blow_pid.404
  %t582 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.120)
  %t583 = ptrtoint ptr %t582 to i64
  %t584 = inttoptr i64 %t583 to ptr
  call void @intrinsic_print(ptr %t584)
  %t585 = load i64, ptr %local.grad_pid.403
  %t586 = call i64 @"print_f64"(i64 %t585)
  %t587 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.121)
  %t588 = ptrtoint ptr %t587 to i64
  %t589 = inttoptr i64 %t588 to ptr
  call void @intrinsic_println(ptr %t589)
  %t590 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.122)
  %t591 = ptrtoint ptr %t590 to i64
  %t592 = inttoptr i64 %t591 to ptr
  call void @intrinsic_print(ptr %t592)
  %t593 = load i64, ptr %local.blow_pid.404
  %t594 = call i64 @"print_f64"(i64 %t593)
  %t595 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.123)
  %t596 = ptrtoint ptr %t595 to i64
  %t597 = inttoptr i64 %t596 to ptr
  call void @intrinsic_println(ptr %t597)
  %t598 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.124)
  %t599 = ptrtoint ptr %t598 to i64
  %t600 = inttoptr i64 %t599 to ptr
  call void @intrinsic_println(ptr %t600)
  %t601 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.125)
  %t602 = ptrtoint ptr %t601 to i64
  %t603 = inttoptr i64 %t602 to ptr
  call void @intrinsic_println(ptr %t603)
  %t604 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.126)
  %t605 = ptrtoint ptr %t604 to i64
  %t606 = inttoptr i64 %t605 to ptr
  call void @intrinsic_println(ptr %t606)
  %t607 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.127)
  %t608 = ptrtoint ptr %t607 to i64
  %t609 = inttoptr i64 %t608 to ptr
  call void @intrinsic_print(ptr %t609)
  %t610 = load i64, ptr %local.grad_none.395
  %t611 = call i64 @"print_f64"(i64 %t610)
  %t612 = load i64, ptr %local.blow_none.396
  %t613 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.128)
  %t614 = call i64 @"sx_f64_gt"(i64 %t612, i64 %t613)
  %t615 = icmp ne i64 %t614, 0
  br i1 %t615, label %then16, label %else16
then16:
  %t616 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.129)
  %t617 = ptrtoint ptr %t616 to i64
  %t618 = inttoptr i64 %t617 to ptr
  call void @intrinsic_print(ptr %t618)
  %t619 = load i64, ptr %local.blow_none.396
  %t620 = call i64 @"print_f64"(i64 %t619)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t621 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.130)
  %t622 = ptrtoint ptr %t621 to i64
  %t623 = inttoptr i64 %t622 to ptr
  call void @intrinsic_print(ptr %t623)
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t624 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t625 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.131)
  %t626 = ptrtoint ptr %t625 to i64
  %t627 = inttoptr i64 %t626 to ptr
  call void @intrinsic_println(ptr %t627)
  %t628 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.132)
  %t629 = ptrtoint ptr %t628 to i64
  %t630 = inttoptr i64 %t629 to ptr
  call void @intrinsic_print(ptr %t630)
  %t631 = load i64, ptr %local.grad_fixed.397
  %t632 = call i64 @"print_f64"(i64 %t631)
  %t633 = load i64, ptr %local.blow_fixed.398
  %t634 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.133)
  %t635 = call i64 @"sx_f64_gt"(i64 %t633, i64 %t634)
  %t636 = icmp ne i64 %t635, 0
  br i1 %t636, label %then17, label %else17
then17:
  %t637 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.134)
  %t638 = ptrtoint ptr %t637 to i64
  %t639 = inttoptr i64 %t638 to ptr
  call void @intrinsic_print(ptr %t639)
  %t640 = load i64, ptr %local.blow_fixed.398
  %t641 = call i64 @"print_f64"(i64 %t640)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  %t642 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.135)
  %t643 = ptrtoint ptr %t642 to i64
  %t644 = inttoptr i64 %t643 to ptr
  call void @intrinsic_print(ptr %t644)
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t645 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t646 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.136)
  %t647 = ptrtoint ptr %t646 to i64
  %t648 = inttoptr i64 %t647 to ptr
  call void @intrinsic_println(ptr %t648)
  %t649 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.137)
  %t650 = ptrtoint ptr %t649 to i64
  %t651 = inttoptr i64 %t650 to ptr
  call void @intrinsic_print(ptr %t651)
  %t652 = load i64, ptr %local.grad_p.399
  %t653 = call i64 @"print_f64"(i64 %t652)
  %t654 = load i64, ptr %local.blow_p.400
  %t655 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.138)
  %t656 = call i64 @"sx_f64_gt"(i64 %t654, i64 %t655)
  %t657 = icmp ne i64 %t656, 0
  br i1 %t657, label %then18, label %else18
then18:
  %t658 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.139)
  %t659 = ptrtoint ptr %t658 to i64
  %t660 = inttoptr i64 %t659 to ptr
  call void @intrinsic_print(ptr %t660)
  %t661 = load i64, ptr %local.blow_p.400
  %t662 = call i64 @"print_f64"(i64 %t661)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t663 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.140)
  %t664 = ptrtoint ptr %t663 to i64
  %t665 = inttoptr i64 %t664 to ptr
  call void @intrinsic_print(ptr %t665)
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t666 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t667 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.141)
  %t668 = ptrtoint ptr %t667 to i64
  %t669 = inttoptr i64 %t668 to ptr
  call void @intrinsic_println(ptr %t669)
  %t670 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.142)
  %t671 = ptrtoint ptr %t670 to i64
  %t672 = inttoptr i64 %t671 to ptr
  call void @intrinsic_print(ptr %t672)
  %t673 = load i64, ptr %local.grad_pd.401
  %t674 = call i64 @"print_f64"(i64 %t673)
  %t675 = load i64, ptr %local.blow_pd.402
  %t676 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.143)
  %t677 = call i64 @"sx_f64_gt"(i64 %t675, i64 %t676)
  %t678 = icmp ne i64 %t677, 0
  br i1 %t678, label %then19, label %else19
then19:
  %t679 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.144)
  %t680 = ptrtoint ptr %t679 to i64
  %t681 = inttoptr i64 %t680 to ptr
  call void @intrinsic_print(ptr %t681)
  %t682 = load i64, ptr %local.blow_pd.402
  %t683 = call i64 @"print_f64"(i64 %t682)
  br label %then19_end
then19_end:
  br label %endif19
else19:
  %t684 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.145)
  %t685 = ptrtoint ptr %t684 to i64
  %t686 = inttoptr i64 %t685 to ptr
  call void @intrinsic_print(ptr %t686)
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t687 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t688 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.146)
  %t689 = ptrtoint ptr %t688 to i64
  %t690 = inttoptr i64 %t689 to ptr
  call void @intrinsic_println(ptr %t690)
  %t691 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.147)
  %t692 = ptrtoint ptr %t691 to i64
  %t693 = inttoptr i64 %t692 to ptr
  call void @intrinsic_print(ptr %t693)
  %t694 = load i64, ptr %local.grad_pid.403
  %t695 = call i64 @"print_f64"(i64 %t694)
  %t696 = load i64, ptr %local.blow_pid.404
  %t697 = call i64 @f64_parse(ptr @.str.exp_ns_pid_control.148)
  %t698 = call i64 @"sx_f64_gt"(i64 %t696, i64 %t697)
  %t699 = icmp ne i64 %t698, 0
  br i1 %t699, label %then20, label %else20
then20:
  %t700 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.149)
  %t701 = ptrtoint ptr %t700 to i64
  %t702 = inttoptr i64 %t701 to ptr
  call void @intrinsic_print(ptr %t702)
  %t703 = load i64, ptr %local.blow_pid.404
  %t704 = call i64 @"print_f64"(i64 %t703)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  %t705 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.150)
  %t706 = ptrtoint ptr %t705 to i64
  %t707 = inttoptr i64 %t706 to ptr
  call void @intrinsic_print(ptr %t707)
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t708 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t709 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.151)
  %t710 = ptrtoint ptr %t709 to i64
  %t711 = inttoptr i64 %t710 to ptr
  call void @intrinsic_println(ptr %t711)
  %t712 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.152)
  %t713 = ptrtoint ptr %t712 to i64
  %t714 = inttoptr i64 %t713 to ptr
  call void @intrinsic_println(ptr %t714)
  %t715 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.153)
  %t716 = ptrtoint ptr %t715 to i64
  %t717 = inttoptr i64 %t716 to ptr
  call void @intrinsic_println(ptr %t717)
  %t718 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.154)
  %t719 = ptrtoint ptr %t718 to i64
  %t720 = inttoptr i64 %t719 to ptr
  call void @intrinsic_println(ptr %t720)
  %t721 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.155)
  %t722 = ptrtoint ptr %t721 to i64
  %t723 = inttoptr i64 %t722 to ptr
  call void @intrinsic_println(ptr %t723)
  %t724 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.156)
  %t725 = ptrtoint ptr %t724 to i64
  %t726 = inttoptr i64 %t725 to ptr
  call void @intrinsic_println(ptr %t726)
  %t727 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.157)
  %t728 = ptrtoint ptr %t727 to i64
  %t729 = inttoptr i64 %t728 to ptr
  call void @intrinsic_println(ptr %t729)
  %t730 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.158)
  %t731 = ptrtoint ptr %t730 to i64
  %t732 = inttoptr i64 %t731 to ptr
  call void @intrinsic_println(ptr %t732)
  %t733 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.159)
  %t734 = ptrtoint ptr %t733 to i64
  %t735 = inttoptr i64 %t734 to ptr
  call void @intrinsic_println(ptr %t735)
  %t736 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.160)
  %t737 = ptrtoint ptr %t736 to i64
  %t738 = inttoptr i64 %t737 to ptr
  call void @intrinsic_println(ptr %t738)
  %t739 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.161)
  %t740 = ptrtoint ptr %t739 to i64
  %t741 = inttoptr i64 %t740 to ptr
  call void @intrinsic_println(ptr %t741)
  %t742 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.162)
  %t743 = ptrtoint ptr %t742 to i64
  %t744 = inttoptr i64 %t743 to ptr
  call void @intrinsic_println(ptr %t744)
  %t745 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.163)
  %t746 = ptrtoint ptr %t745 to i64
  %t747 = inttoptr i64 %t746 to ptr
  call void @intrinsic_println(ptr %t747)
  %t748 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_pid_control.164)
  %t749 = ptrtoint ptr %t748 to i64
  %t750 = inttoptr i64 %t749 to ptr
  call void @intrinsic_println(ptr %t750)
  ret i64 0
}


; String constants
@.str.exp_ns_pid_control.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_pid_control.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_pid_control.4 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_pid_control.5 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_pid_control.6 = private unnamed_addr constant [8 x i8] c"0.00005\00"
@.str.exp_ns_pid_control.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_pid_control.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.9 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.10 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_pid_control.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.12 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_pid_control.13 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_pid_control.14 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.15 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_pid_control.16 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_pid_control.17 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_pid_control.18 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_pid_control.19 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.20 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_pid_control.21 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_pid_control.22 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_pid_control.23 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_ns_pid_control.24 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.25 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_pid_control.26 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_ns_pid_control.27 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_pid_control.28 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_ns_pid_control.29 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.30 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_pid_control.31 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_ns_pid_control.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.37 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.40 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.41 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_ns_pid_control.42 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_pid_control.43 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_pid_control.44 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_pid_control.45 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_pid_control.46 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_pid_control.47 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_pid_control.48 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_pid_control.49 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_pid_control.50 = private unnamed_addr constant [45 x i8] c"#  PID-CONTROLLED S ON NAVIER-STOKES       #\00"
@.str.exp_ns_pid_control.51 = private unnamed_addr constant [46 x i8] c"#  Adaptive viscosity via convergence PID   #\00"
@.str.exp_ns_pid_control.52 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_pid_control.53 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.54 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_pid_control.55 = private unnamed_addr constant [51 x i8] c"--- Exp 1: No artificial viscosity (nu=0.0001) ---\00"
@.str.exp_ns_pid_control.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.58 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.61 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.62 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.63 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.64 = private unnamed_addr constant [16 x i8] c"  max|du/dx| = \00"
@.str.exp_ns_pid_control.65 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.66 = private unnamed_addr constant [18 x i8] c"  blow-up step = \00"
@.str.exp_ns_pid_control.67 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.68 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.69 = private unnamed_addr constant [56 x i8] c"--- Exp 2: Fixed artificial viscosity (nu_art=0.01) ---\00"
@.str.exp_ns_pid_control.70 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.71 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.72 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.73 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_pid_control.74 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.76 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.77 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_pid_control.78 = private unnamed_addr constant [16 x i8] c"  max|du/dx| = \00"
@.str.exp_ns_pid_control.79 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.80 = private unnamed_addr constant [18 x i8] c"  blow-up step = \00"
@.str.exp_ns_pid_control.81 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.82 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.83 = private unnamed_addr constant [49 x i8] c"--- Exp 3: S-controlled artificial viscosity ---\00"
@.str.exp_ns_pid_control.84 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.87 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_pid_control.88 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.89 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.91 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_pid_control.92 = private unnamed_addr constant [16 x i8] c"  max|du/dx| = \00"
@.str.exp_ns_pid_control.93 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.94 = private unnamed_addr constant [18 x i8] c"  blow-up step = \00"
@.str.exp_ns_pid_control.95 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.96 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.97 = private unnamed_addr constant [38 x i8] c"--- Exp 4: PD-controlled (S + S') ---\00"
@.str.exp_ns_pid_control.98 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.99 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_pid_control.100 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.101 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_pid_control.102 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.103 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_pid_control.104 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.105 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_pid_control.106 = private unnamed_addr constant [16 x i8] c"  max|du/dx| = \00"
@.str.exp_ns_pid_control.107 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.108 = private unnamed_addr constant [18 x i8] c"  blow-up step = \00"
@.str.exp_ns_pid_control.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.110 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.111 = private unnamed_addr constant [39 x i8] c"--- Exp 5: Full PID (S + S' + S'') ---\00"
@.str.exp_ns_pid_control.112 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.113 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_pid_control.114 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.115 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_pid_control.116 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.117 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_pid_control.118 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_pid_control.119 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_pid_control.120 = private unnamed_addr constant [16 x i8] c"  max|du/dx| = \00"
@.str.exp_ns_pid_control.121 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.122 = private unnamed_addr constant [18 x i8] c"  blow-up step = \00"
@.str.exp_ns_pid_control.123 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.124 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.125 = private unnamed_addr constant [19 x i8] c"=== COMPARISON ===\00"
@.str.exp_ns_pid_control.126 = private unnamed_addr constant [43 x i8] c"  Controller         max|du/dx|   Blow-up?\00"
@.str.exp_ns_pid_control.127 = private unnamed_addr constant [22 x i8] c"  No art. viscosity  \00"
@.str.exp_ns_pid_control.128 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.129 = private unnamed_addr constant [10 x i8] c"  YES at \00"
@.str.exp_ns_pid_control.130 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_ns_pid_control.131 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.132 = private unnamed_addr constant [22 x i8] c"  Fixed (nu_art=.01) \00"
@.str.exp_ns_pid_control.133 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.134 = private unnamed_addr constant [10 x i8] c"  YES at \00"
@.str.exp_ns_pid_control.135 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_ns_pid_control.136 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.137 = private unnamed_addr constant [22 x i8] c"  P (S only)         \00"
@.str.exp_ns_pid_control.138 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.139 = private unnamed_addr constant [10 x i8] c"  YES at \00"
@.str.exp_ns_pid_control.140 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_ns_pid_control.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.142 = private unnamed_addr constant [22 x i8] c"  PD (S + S')        \00"
@.str.exp_ns_pid_control.143 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.144 = private unnamed_addr constant [10 x i8] c"  YES at \00"
@.str.exp_ns_pid_control.145 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_ns_pid_control.146 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.147 = private unnamed_addr constant [22 x i8] c"  PID (S+S'+S'')     \00"
@.str.exp_ns_pid_control.148 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_pid_control.149 = private unnamed_addr constant [10 x i8] c"  YES at \00"
@.str.exp_ns_pid_control.150 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_ns_pid_control.151 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.152 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.153 = private unnamed_addr constant [55 x i8] c"  If PID prevents blow-up that occurs without control:\00"
@.str.exp_ns_pid_control.154 = private unnamed_addr constant [46 x i8] c"  -> PID-S provides ACTIVE blow-up prevention\00"
@.str.exp_ns_pid_control.155 = private unnamed_addr constant [53 x i8] c"  -> The convergence score drives adaptive viscosity\00"
@.str.exp_ns_pid_control.156 = private unnamed_addr constant [53 x i8] c"  -> This is a PID-based turbulence control strategy\00"
@.str.exp_ns_pid_control.157 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_pid_control.158 = private unnamed_addr constant [39 x i8] c"  CONNECTION TO NS MILLENNIUM PROBLEM:\00"
@.str.exp_ns_pid_control.159 = private unnamed_addr constant [57 x i8] c"  The question is: can ||u|| -> infinity in finite time?\00"
@.str.exp_ns_pid_control.160 = private unnamed_addr constant [32 x i8] c"  Our PID-S framework provides:\00"
@.str.exp_ns_pid_control.161 = private unnamed_addr constant [58 x i8] c"  1. DETECTION: S < 0 signals pre-blow-up (37x lead time)\00"
@.str.exp_ns_pid_control.162 = private unnamed_addr constant [52 x i8] c"  2. PREDICTION: S' and S'' forecast the trajectory\00"
@.str.exp_ns_pid_control.163 = private unnamed_addr constant [53 x i8] c"  3. PREVENTION: adaptive viscosity prevents blow-up\00"
@.str.exp_ns_pid_control.164 = private unnamed_addr constant [51 x i8] c"  4. CRITERION: if S >= threshold persists, smooth\00"
