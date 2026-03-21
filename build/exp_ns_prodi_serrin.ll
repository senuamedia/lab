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
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"my_sqrt"(i64 %x) nounwind {
entry:
  %local.g.9 = alloca i64
  %local.i.10 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t11 = load i64, ptr %local.x
  %t12 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.2)
  %t13 = call i64 @"sx_f64_le"(i64 %t11, i64 %t12)
  %t14 = icmp ne i64 %t13, 0
  br i1 %t14, label %then1, label %else1
then1:
  %t15 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.3)
  ret i64 %t15
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t16 = phi i64 [ 0, %else1_end ]
  %t17 = load i64, ptr %local.x
  store i64 %t17, ptr %local.g.9
  store i64 0, ptr %local.i.10
  br label %loop2
loop2:
  %t18 = load i64, ptr %local.i.10
  %t19 = icmp slt i64 %t18, 30
  %t20 = zext i1 %t19 to i64
  %t21 = icmp ne i64 %t20, 0
  br i1 %t21, label %body2, label %endloop2
body2:
  %t22 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.4)
  %t23 = load i64, ptr %local.g.9
  %t24 = load i64, ptr %local.x
  %t25 = load i64, ptr %local.g.9
  %t26 = call i64 @"sx_f64_div"(i64 %t24, i64 %t25)
  %t27 = call i64 @"sx_f64_add"(i64 %t23, i64 %t26)
  %t28 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t27)
  store i64 %t28, ptr %local.g.9
  %t29 = load i64, ptr %local.i.10
  %t30 = add i64 %t29, 1
  store i64 %t30, ptr %local.i.10
  br label %loop2
endloop2:
  %t31 = load i64, ptr %local.g.9
  ret i64 %t31
}

define i64 @"enstrophy"(i64 %ox, i64 %oy, i64 %oz) nounwind {
entry:
  %local.ox = alloca i64
  store i64 %ox, ptr %local.ox
  %local.oy = alloca i64
  store i64 %oy, ptr %local.oy
  %local.oz = alloca i64
  store i64 %oz, ptr %local.oz
  %t32 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.5)
  %t33 = load i64, ptr %local.ox
  %t34 = load i64, ptr %local.ox
  %t35 = call i64 @"sx_f64_mul"(i64 %t33, i64 %t34)
  %t36 = load i64, ptr %local.oy
  %t37 = load i64, ptr %local.oy
  %t38 = call i64 @"sx_f64_mul"(i64 %t36, i64 %t37)
  %t39 = call i64 @"sx_f64_add"(i64 %t35, i64 %t38)
  %t40 = load i64, ptr %local.oz
  %t41 = load i64, ptr %local.oz
  %t42 = call i64 @"sx_f64_mul"(i64 %t40, i64 %t41)
  %t43 = call i64 @"sx_f64_add"(i64 %t39, i64 %t42)
  %t44 = call i64 @"sx_f64_mul"(i64 %t32, i64 %t43)
  ret i64 %t44
}

define i64 @"vel_l2_sq"(i64 %u, i64 %v, i64 %w) nounwind {
entry:
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %t45 = load i64, ptr %local.u
  %t46 = load i64, ptr %local.u
  %t47 = call i64 @"sx_f64_mul"(i64 %t45, i64 %t46)
  %t48 = load i64, ptr %local.v
  %t49 = load i64, ptr %local.v
  %t50 = call i64 @"sx_f64_mul"(i64 %t48, i64 %t49)
  %t51 = call i64 @"sx_f64_add"(i64 %t47, i64 %t50)
  %t52 = load i64, ptr %local.w
  %t53 = load i64, ptr %local.w
  %t54 = call i64 @"sx_f64_mul"(i64 %t52, i64 %t53)
  %t55 = call i64 @"sx_f64_add"(i64 %t51, i64 %t54)
  ret i64 %t55
}

define i64 @"vel_l3_cubed"(i64 %u, i64 %v, i64 %w) nounwind {
entry:
  %local.mag.56 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %t57 = load i64, ptr %local.u
  %t58 = load i64, ptr %local.u
  %t59 = call i64 @"sx_f64_mul"(i64 %t57, i64 %t58)
  %t60 = load i64, ptr %local.v
  %t61 = load i64, ptr %local.v
  %t62 = call i64 @"sx_f64_mul"(i64 %t60, i64 %t61)
  %t63 = call i64 @"sx_f64_add"(i64 %t59, i64 %t62)
  %t64 = load i64, ptr %local.w
  %t65 = load i64, ptr %local.w
  %t66 = call i64 @"sx_f64_mul"(i64 %t64, i64 %t65)
  %t67 = call i64 @"sx_f64_add"(i64 %t63, i64 %t66)
  %t68 = call i64 @"my_sqrt"(i64 %t67)
  store i64 %t68, ptr %local.mag.56
  %t69 = load i64, ptr %local.mag.56
  %t70 = load i64, ptr %local.mag.56
  %t71 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t70)
  %t72 = load i64, ptr %local.mag.56
  %t73 = call i64 @"sx_f64_mul"(i64 %t71, i64 %t72)
  ret i64 %t73
}

define i64 @"vel_l6_sixth"(i64 %u, i64 %v, i64 %w) nounwind {
entry:
  %local.sq.74 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %t75 = load i64, ptr %local.u
  %t76 = load i64, ptr %local.u
  %t77 = call i64 @"sx_f64_mul"(i64 %t75, i64 %t76)
  %t78 = load i64, ptr %local.v
  %t79 = load i64, ptr %local.v
  %t80 = call i64 @"sx_f64_mul"(i64 %t78, i64 %t79)
  %t81 = call i64 @"sx_f64_add"(i64 %t77, i64 %t80)
  %t82 = load i64, ptr %local.w
  %t83 = load i64, ptr %local.w
  %t84 = call i64 @"sx_f64_mul"(i64 %t82, i64 %t83)
  %t85 = call i64 @"sx_f64_add"(i64 %t81, i64 %t84)
  store i64 %t85, ptr %local.sq.74
  %t86 = load i64, ptr %local.sq.74
  %t87 = load i64, ptr %local.sq.74
  %t88 = call i64 @"sx_f64_mul"(i64 %t86, i64 %t87)
  %t89 = load i64, ptr %local.sq.74
  %t90 = call i64 @"sx_f64_mul"(i64 %t88, i64 %t89)
  ret i64 %t90
}

define i64 @"vort_linf"(i64 %ox, i64 %oy, i64 %oz) nounwind {
entry:
  %local.m.91 = alloca i64
  %local.ox = alloca i64
  store i64 %ox, ptr %local.ox
  %local.oy = alloca i64
  store i64 %oy, ptr %local.oy
  %local.oz = alloca i64
  store i64 %oz, ptr %local.oz
  %t92 = load i64, ptr %local.ox
  %t93 = call i64 @"abs_f64"(i64 %t92)
  store i64 %t93, ptr %local.m.91
  %t94 = load i64, ptr %local.oy
  %t95 = call i64 @"abs_f64"(i64 %t94)
  %t96 = load i64, ptr %local.m.91
  %t97 = call i64 @"sx_f64_gt"(i64 %t95, i64 %t96)
  %t98 = icmp ne i64 %t97, 0
  br i1 %t98, label %then3, label %else3
then3:
  %t99 = load i64, ptr %local.oy
  %t100 = call i64 @"abs_f64"(i64 %t99)
  store i64 %t100, ptr %local.m.91
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t101 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t102 = load i64, ptr %local.oz
  %t103 = call i64 @"abs_f64"(i64 %t102)
  %t104 = load i64, ptr %local.m.91
  %t105 = call i64 @"sx_f64_gt"(i64 %t103, i64 %t104)
  %t106 = icmp ne i64 %t105, 0
  br i1 %t106, label %then4, label %else4
then4:
  %t107 = load i64, ptr %local.oz
  %t108 = call i64 @"abs_f64"(i64 %t107)
  store i64 %t108, ptr %local.m.91
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t109 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t110 = load i64, ptr %local.m.91
  ret i64 %t110
}

define i64 @"step6"(i64 %u, i64 %v, i64 %w, i64 %ox, i64 %oy, i64 %oz, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.111 = alloca i64
  %local.fd_u.112 = alloca i64
  %local.fd_v.113 = alloca i64
  %local.fd_w.114 = alloca i64
  %local.fd_ox.115 = alloca i64
  %local.fd_oy.116 = alloca i64
  %local.fd_oz.117 = alloca i64
  %local.fs_u.118 = alloca i64
  %local.fs_v.119 = alloca i64
  %local.fs_w.120 = alloca i64
  %local.fv_ox.121 = alloca i64
  %local.fv_oy.122 = alloca i64
  %local.fv_oz.123 = alloca i64
  %local.fq_ox.124 = alloca i64
  %local.fq_oy.125 = alloca i64
  %local.fq_oz.126 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.ox = alloca i64
  store i64 %ox, ptr %local.ox
  %local.oy = alloca i64
  store i64 %oy, ptr %local.oy
  %local.oz = alloca i64
  store i64 %oz, ptr %local.oz
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t127 = load i64, ptr %local.ox
  %t128 = load i64, ptr %local.ox
  %t129 = call i64 @"sx_f64_mul"(i64 %t127, i64 %t128)
  %t130 = load i64, ptr %local.oy
  %t131 = load i64, ptr %local.oy
  %t132 = call i64 @"sx_f64_mul"(i64 %t130, i64 %t131)
  %t133 = call i64 @"sx_f64_add"(i64 %t129, i64 %t132)
  %t134 = load i64, ptr %local.oz
  %t135 = load i64, ptr %local.oz
  %t136 = call i64 @"sx_f64_mul"(i64 %t134, i64 %t135)
  %t137 = call i64 @"sx_f64_add"(i64 %t133, i64 %t136)
  store i64 %t137, ptr %local.omega_sq.111
  %t138 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.6)
  %t139 = load i64, ptr %local.nu
  %t140 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.7)
  %t141 = call i64 @"sx_f64_mul"(i64 %t139, i64 %t140)
  %t142 = load i64, ptr %local.u
  %t143 = call i64 @"sx_f64_mul"(i64 %t141, i64 %t142)
  %t144 = call i64 @"sx_f64_sub"(i64 %t138, i64 %t143)
  store i64 %t144, ptr %local.fd_u.112
  %t145 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.8)
  %t146 = load i64, ptr %local.nu
  %t147 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.9)
  %t148 = call i64 @"sx_f64_mul"(i64 %t146, i64 %t147)
  %t149 = load i64, ptr %local.v
  %t150 = call i64 @"sx_f64_mul"(i64 %t148, i64 %t149)
  %t151 = call i64 @"sx_f64_sub"(i64 %t145, i64 %t150)
  store i64 %t151, ptr %local.fd_v.113
  %t152 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.10)
  %t153 = load i64, ptr %local.nu
  %t154 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.11)
  %t155 = call i64 @"sx_f64_mul"(i64 %t153, i64 %t154)
  %t156 = load i64, ptr %local.w
  %t157 = call i64 @"sx_f64_mul"(i64 %t155, i64 %t156)
  %t158 = call i64 @"sx_f64_sub"(i64 %t152, i64 %t157)
  store i64 %t158, ptr %local.fd_w.114
  %t159 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.12)
  %t160 = load i64, ptr %local.nu
  %t161 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.13)
  %t162 = call i64 @"sx_f64_mul"(i64 %t160, i64 %t161)
  %t163 = load i64, ptr %local.ox
  %t164 = call i64 @"sx_f64_mul"(i64 %t162, i64 %t163)
  %t165 = call i64 @"sx_f64_sub"(i64 %t159, i64 %t164)
  store i64 %t165, ptr %local.fd_ox.115
  %t166 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.14)
  %t167 = load i64, ptr %local.nu
  %t168 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.15)
  %t169 = call i64 @"sx_f64_mul"(i64 %t167, i64 %t168)
  %t170 = load i64, ptr %local.oy
  %t171 = call i64 @"sx_f64_mul"(i64 %t169, i64 %t170)
  %t172 = call i64 @"sx_f64_sub"(i64 %t166, i64 %t171)
  store i64 %t172, ptr %local.fd_oy.116
  %t173 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.16)
  %t174 = load i64, ptr %local.nu
  %t175 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.17)
  %t176 = call i64 @"sx_f64_mul"(i64 %t174, i64 %t175)
  %t177 = load i64, ptr %local.oz
  %t178 = call i64 @"sx_f64_mul"(i64 %t176, i64 %t177)
  %t179 = call i64 @"sx_f64_sub"(i64 %t173, i64 %t178)
  store i64 %t179, ptr %local.fd_oz.117
  %t180 = load i64, ptr %local.sigma
  %t181 = load i64, ptr %local.oy
  %t182 = load i64, ptr %local.w
  %t183 = call i64 @"sx_f64_mul"(i64 %t181, i64 %t182)
  %t184 = load i64, ptr %local.oz
  %t185 = load i64, ptr %local.v
  %t186 = call i64 @"sx_f64_mul"(i64 %t184, i64 %t185)
  %t187 = call i64 @"sx_f64_sub"(i64 %t183, i64 %t186)
  %t188 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t187)
  store i64 %t188, ptr %local.fs_u.118
  %t189 = load i64, ptr %local.sigma
  %t190 = load i64, ptr %local.oz
  %t191 = load i64, ptr %local.u
  %t192 = call i64 @"sx_f64_mul"(i64 %t190, i64 %t191)
  %t193 = load i64, ptr %local.ox
  %t194 = load i64, ptr %local.w
  %t195 = call i64 @"sx_f64_mul"(i64 %t193, i64 %t194)
  %t196 = call i64 @"sx_f64_sub"(i64 %t192, i64 %t195)
  %t197 = call i64 @"sx_f64_mul"(i64 %t189, i64 %t196)
  store i64 %t197, ptr %local.fs_v.119
  %t198 = load i64, ptr %local.sigma
  %t199 = load i64, ptr %local.ox
  %t200 = load i64, ptr %local.v
  %t201 = call i64 @"sx_f64_mul"(i64 %t199, i64 %t200)
  %t202 = load i64, ptr %local.oy
  %t203 = load i64, ptr %local.u
  %t204 = call i64 @"sx_f64_mul"(i64 %t202, i64 %t203)
  %t205 = call i64 @"sx_f64_sub"(i64 %t201, i64 %t204)
  %t206 = call i64 @"sx_f64_mul"(i64 %t198, i64 %t205)
  store i64 %t206, ptr %local.fs_w.120
  %t207 = load i64, ptr %local.lambda
  %t208 = load i64, ptr %local.oy
  %t209 = load i64, ptr %local.w
  %t210 = call i64 @"sx_f64_mul"(i64 %t208, i64 %t209)
  %t211 = load i64, ptr %local.oz
  %t212 = load i64, ptr %local.u
  %t213 = call i64 @"sx_f64_mul"(i64 %t211, i64 %t212)
  %t214 = call i64 @"sx_f64_add"(i64 %t210, i64 %t213)
  %t215 = call i64 @"sx_f64_mul"(i64 %t207, i64 %t214)
  store i64 %t215, ptr %local.fv_ox.121
  %t216 = load i64, ptr %local.lambda
  %t217 = load i64, ptr %local.oz
  %t218 = load i64, ptr %local.u
  %t219 = call i64 @"sx_f64_mul"(i64 %t217, i64 %t218)
  %t220 = load i64, ptr %local.ox
  %t221 = load i64, ptr %local.w
  %t222 = call i64 @"sx_f64_mul"(i64 %t220, i64 %t221)
  %t223 = call i64 @"sx_f64_add"(i64 %t219, i64 %t222)
  %t224 = call i64 @"sx_f64_mul"(i64 %t216, i64 %t223)
  store i64 %t224, ptr %local.fv_oy.122
  %t225 = load i64, ptr %local.lambda
  %t226 = load i64, ptr %local.ox
  %t227 = load i64, ptr %local.v
  %t228 = call i64 @"sx_f64_mul"(i64 %t226, i64 %t227)
  %t229 = load i64, ptr %local.oy
  %t230 = load i64, ptr %local.u
  %t231 = call i64 @"sx_f64_mul"(i64 %t229, i64 %t230)
  %t232 = call i64 @"sx_f64_add"(i64 %t228, i64 %t231)
  %t233 = call i64 @"sx_f64_mul"(i64 %t225, i64 %t232)
  store i64 %t233, ptr %local.fv_oz.123
  %t234 = load i64, ptr %local.lambda2
  %t235 = load i64, ptr %local.omega_sq.111
  %t236 = call i64 @"sx_f64_mul"(i64 %t234, i64 %t235)
  %t237 = load i64, ptr %local.ox
  %t238 = call i64 @"sx_f64_mul"(i64 %t236, i64 %t237)
  store i64 %t238, ptr %local.fq_ox.124
  %t239 = load i64, ptr %local.lambda2
  %t240 = load i64, ptr %local.omega_sq.111
  %t241 = call i64 @"sx_f64_mul"(i64 %t239, i64 %t240)
  %t242 = load i64, ptr %local.oy
  %t243 = call i64 @"sx_f64_mul"(i64 %t241, i64 %t242)
  store i64 %t243, ptr %local.fq_oy.125
  %t244 = load i64, ptr %local.lambda2
  %t245 = load i64, ptr %local.omega_sq.111
  %t246 = call i64 @"sx_f64_mul"(i64 %t244, i64 %t245)
  %t247 = load i64, ptr %local.oz
  %t248 = call i64 @"sx_f64_mul"(i64 %t246, i64 %t247)
  store i64 %t248, ptr %local.fq_oz.126
  %t249 = load i64, ptr %local.which
  %t250 = icmp eq i64 %t249, 0
  %t251 = zext i1 %t250 to i64
  %t252 = icmp ne i64 %t251, 0
  br i1 %t252, label %then5, label %else5
then5:
  %t253 = load i64, ptr %local.u
  %t254 = load i64, ptr %local.dt
  %t255 = load i64, ptr %local.fd_u.112
  %t256 = load i64, ptr %local.fs_u.118
  %t257 = call i64 @"sx_f64_add"(i64 %t255, i64 %t256)
  %t258 = call i64 @"sx_f64_mul"(i64 %t254, i64 %t257)
  %t259 = call i64 @"sx_f64_add"(i64 %t253, i64 %t258)
  ret i64 %t259
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t260 = phi i64 [ 0, %else5_end ]
  %t261 = load i64, ptr %local.which
  %t262 = icmp eq i64 %t261, 1
  %t263 = zext i1 %t262 to i64
  %t264 = icmp ne i64 %t263, 0
  br i1 %t264, label %then6, label %else6
then6:
  %t265 = load i64, ptr %local.v
  %t266 = load i64, ptr %local.dt
  %t267 = load i64, ptr %local.fd_v.113
  %t268 = load i64, ptr %local.fs_v.119
  %t269 = call i64 @"sx_f64_add"(i64 %t267, i64 %t268)
  %t270 = call i64 @"sx_f64_mul"(i64 %t266, i64 %t269)
  %t271 = call i64 @"sx_f64_add"(i64 %t265, i64 %t270)
  ret i64 %t271
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t272 = phi i64 [ 0, %else6_end ]
  %t273 = load i64, ptr %local.which
  %t274 = icmp eq i64 %t273, 2
  %t275 = zext i1 %t274 to i64
  %t276 = icmp ne i64 %t275, 0
  br i1 %t276, label %then7, label %else7
then7:
  %t277 = load i64, ptr %local.w
  %t278 = load i64, ptr %local.dt
  %t279 = load i64, ptr %local.fd_w.114
  %t280 = load i64, ptr %local.fs_w.120
  %t281 = call i64 @"sx_f64_add"(i64 %t279, i64 %t280)
  %t282 = call i64 @"sx_f64_mul"(i64 %t278, i64 %t281)
  %t283 = call i64 @"sx_f64_add"(i64 %t277, i64 %t282)
  ret i64 %t283
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t284 = phi i64 [ 0, %else7_end ]
  %t285 = load i64, ptr %local.which
  %t286 = icmp eq i64 %t285, 3
  %t287 = zext i1 %t286 to i64
  %t288 = icmp ne i64 %t287, 0
  br i1 %t288, label %then8, label %else8
then8:
  %t289 = load i64, ptr %local.ox
  %t290 = load i64, ptr %local.dt
  %t291 = load i64, ptr %local.fd_ox.115
  %t292 = load i64, ptr %local.fv_ox.121
  %t293 = call i64 @"sx_f64_add"(i64 %t291, i64 %t292)
  %t294 = load i64, ptr %local.fq_ox.124
  %t295 = call i64 @"sx_f64_add"(i64 %t293, i64 %t294)
  %t296 = call i64 @"sx_f64_mul"(i64 %t290, i64 %t295)
  %t297 = call i64 @"sx_f64_add"(i64 %t289, i64 %t296)
  ret i64 %t297
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t298 = phi i64 [ 0, %else8_end ]
  %t299 = load i64, ptr %local.which
  %t300 = icmp eq i64 %t299, 4
  %t301 = zext i1 %t300 to i64
  %t302 = icmp ne i64 %t301, 0
  br i1 %t302, label %then9, label %else9
then9:
  %t303 = load i64, ptr %local.oy
  %t304 = load i64, ptr %local.dt
  %t305 = load i64, ptr %local.fd_oy.116
  %t306 = load i64, ptr %local.fv_oy.122
  %t307 = call i64 @"sx_f64_add"(i64 %t305, i64 %t306)
  %t308 = load i64, ptr %local.fq_oy.125
  %t309 = call i64 @"sx_f64_add"(i64 %t307, i64 %t308)
  %t310 = call i64 @"sx_f64_mul"(i64 %t304, i64 %t309)
  %t311 = call i64 @"sx_f64_add"(i64 %t303, i64 %t310)
  ret i64 %t311
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t312 = phi i64 [ 0, %else9_end ]
  %t313 = load i64, ptr %local.oz
  %t314 = load i64, ptr %local.dt
  %t315 = load i64, ptr %local.fd_oz.117
  %t316 = load i64, ptr %local.fv_oz.123
  %t317 = call i64 @"sx_f64_add"(i64 %t315, i64 %t316)
  %t318 = load i64, ptr %local.fq_oz.126
  %t319 = call i64 @"sx_f64_add"(i64 %t317, i64 %t318)
  %t320 = call i64 @"sx_f64_mul"(i64 %t314, i64 %t319)
  %t321 = call i64 @"sx_f64_add"(i64 %t313, i64 %t320)
  ret i64 %t321
}

define i64 @"run_ps"(i64 %amp, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps, i64 %query) nounwind {
entry:
  %local.pi.322 = alloca i64
  %local.u.323 = alloca i64
  %local.v.324 = alloca i64
  %local.w.325 = alloca i64
  %local.ox.326 = alloca i64
  %local.oy.327 = alloca i64
  %local.oz.328 = alloca i64
  %local.sup_l3.329 = alloca i64
  %local.int_l6_4.330 = alloca i64
  %local.int_bkm.331 = alloca i64
  %local.sup_enst.332 = alloca i64
  %local.sup_energy.333 = alloca i64
  %local.s.334 = alloca i64
  %local.l3_val.335 = alloca i64
  %local.l6_val.336 = alloca i64
  %local.l6_4.337 = alloca i64
  %local.bkm_val.338 = alloca i64
  %local.bkm_sq.339 = alloca i64
  %local.enst.340 = alloca i64
  %local.energy.341 = alloca i64
  %local.n0.342 = alloca i64
  %local.n1.343 = alloca i64
  %local.n2.344 = alloca i64
  %local.n3.345 = alloca i64
  %local.n4.346 = alloca i64
  %local.n5.347 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %local.query = alloca i64
  store i64 %query, ptr %local.query
  %t348 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.18)
  store i64 %t348, ptr %local.pi.322
  %t349 = load i64, ptr %local.amp
  %t350 = load i64, ptr %local.pi.322
  %t351 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.19)
  %t352 = call i64 @"sx_f64_mul"(i64 %t350, i64 %t351)
  %t353 = call i64 @"sin_f64"(i64 %t352)
  %t354 = call i64 @"sx_f64_mul"(i64 %t349, i64 %t353)
  store i64 %t354, ptr %local.u.323
  %t355 = load i64, ptr %local.amp
  %t356 = load i64, ptr %local.pi.322
  %t357 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.20)
  %t358 = call i64 @"sx_f64_mul"(i64 %t356, i64 %t357)
  %t359 = call i64 @"sin_f64"(i64 %t358)
  %t360 = call i64 @"sx_f64_mul"(i64 %t355, i64 %t359)
  store i64 %t360, ptr %local.v.324
  %t361 = load i64, ptr %local.amp
  %t362 = load i64, ptr %local.pi.322
  %t363 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.21)
  %t364 = call i64 @"sx_f64_mul"(i64 %t362, i64 %t363)
  %t365 = call i64 @"sin_f64"(i64 %t364)
  %t366 = call i64 @"sx_f64_mul"(i64 %t361, i64 %t365)
  store i64 %t366, ptr %local.w.325
  %t367 = load i64, ptr %local.amp
  %t368 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.22)
  %t369 = call i64 @"sx_f64_mul"(i64 %t367, i64 %t368)
  %t370 = load i64, ptr %local.pi.322
  %t371 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.23)
  %t372 = call i64 @"sx_f64_mul"(i64 %t370, i64 %t371)
  %t373 = call i64 @"sin_f64"(i64 %t372)
  %t374 = call i64 @"sx_f64_mul"(i64 %t369, i64 %t373)
  store i64 %t374, ptr %local.ox.326
  %t375 = load i64, ptr %local.amp
  %t376 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.24)
  %t377 = call i64 @"sx_f64_mul"(i64 %t375, i64 %t376)
  %t378 = load i64, ptr %local.pi.322
  %t379 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.25)
  %t380 = call i64 @"sx_f64_mul"(i64 %t378, i64 %t379)
  %t381 = call i64 @"sin_f64"(i64 %t380)
  %t382 = call i64 @"sx_f64_mul"(i64 %t377, i64 %t381)
  store i64 %t382, ptr %local.oy.327
  %t383 = load i64, ptr %local.amp
  %t384 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.26)
  %t385 = call i64 @"sx_f64_mul"(i64 %t383, i64 %t384)
  %t386 = load i64, ptr %local.pi.322
  %t387 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.27)
  %t388 = call i64 @"sx_f64_mul"(i64 %t386, i64 %t387)
  %t389 = call i64 @"sin_f64"(i64 %t388)
  %t390 = call i64 @"sx_f64_mul"(i64 %t385, i64 %t389)
  store i64 %t390, ptr %local.oz.328
  %t391 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.28)
  store i64 %t391, ptr %local.sup_l3.329
  %t392 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.29)
  store i64 %t392, ptr %local.int_l6_4.330
  %t393 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.30)
  store i64 %t393, ptr %local.int_bkm.331
  %t394 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.31)
  store i64 %t394, ptr %local.sup_enst.332
  %t395 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.32)
  store i64 %t395, ptr %local.sup_energy.333
  store i64 0, ptr %local.s.334
  br label %loop10
loop10:
  %t396 = load i64, ptr %local.s.334
  %t397 = load i64, ptr %local.max_steps
  %t398 = icmp slt i64 %t396, %t397
  %t399 = zext i1 %t398 to i64
  %t400 = icmp ne i64 %t399, 0
  br i1 %t400, label %body10, label %endloop10
body10:
  %t401 = load i64, ptr %local.u.323
  %t402 = load i64, ptr %local.v.324
  %t403 = load i64, ptr %local.w.325
  %t404 = call i64 @"vel_l3_cubed"(i64 %t401, i64 %t402, i64 %t403)
  store i64 %t404, ptr %local.l3_val.335
  %t405 = load i64, ptr %local.u.323
  %t406 = load i64, ptr %local.v.324
  %t407 = load i64, ptr %local.w.325
  %t408 = call i64 @"vel_l6_sixth"(i64 %t405, i64 %t406, i64 %t407)
  store i64 %t408, ptr %local.l6_val.336
  %t409 = load i64, ptr %local.u.323
  %t410 = load i64, ptr %local.u.323
  %t411 = call i64 @"sx_f64_mul"(i64 %t409, i64 %t410)
  %t412 = load i64, ptr %local.v.324
  %t413 = load i64, ptr %local.v.324
  %t414 = call i64 @"sx_f64_mul"(i64 %t412, i64 %t413)
  %t415 = call i64 @"sx_f64_add"(i64 %t411, i64 %t414)
  %t416 = load i64, ptr %local.w.325
  %t417 = load i64, ptr %local.w.325
  %t418 = call i64 @"sx_f64_mul"(i64 %t416, i64 %t417)
  %t419 = call i64 @"sx_f64_add"(i64 %t415, i64 %t418)
  %t420 = load i64, ptr %local.u.323
  %t421 = load i64, ptr %local.u.323
  %t422 = call i64 @"sx_f64_mul"(i64 %t420, i64 %t421)
  %t423 = load i64, ptr %local.v.324
  %t424 = load i64, ptr %local.v.324
  %t425 = call i64 @"sx_f64_mul"(i64 %t423, i64 %t424)
  %t426 = call i64 @"sx_f64_add"(i64 %t422, i64 %t425)
  %t427 = load i64, ptr %local.w.325
  %t428 = load i64, ptr %local.w.325
  %t429 = call i64 @"sx_f64_mul"(i64 %t427, i64 %t428)
  %t430 = call i64 @"sx_f64_add"(i64 %t426, i64 %t429)
  %t431 = call i64 @"sx_f64_mul"(i64 %t419, i64 %t430)
  store i64 %t431, ptr %local.l6_4.337
  %t432 = load i64, ptr %local.ox.326
  %t433 = load i64, ptr %local.oy.327
  %t434 = load i64, ptr %local.oz.328
  %t435 = call i64 @"vort_linf"(i64 %t432, i64 %t433, i64 %t434)
  store i64 %t435, ptr %local.bkm_val.338
  %t436 = load i64, ptr %local.bkm_val.338
  %t437 = load i64, ptr %local.bkm_val.338
  %t438 = call i64 @"sx_f64_mul"(i64 %t436, i64 %t437)
  store i64 %t438, ptr %local.bkm_sq.339
  %t439 = load i64, ptr %local.ox.326
  %t440 = load i64, ptr %local.oy.327
  %t441 = load i64, ptr %local.oz.328
  %t442 = call i64 @"enstrophy"(i64 %t439, i64 %t440, i64 %t441)
  store i64 %t442, ptr %local.enst.340
  %t443 = load i64, ptr %local.u.323
  %t444 = load i64, ptr %local.v.324
  %t445 = load i64, ptr %local.w.325
  %t446 = call i64 @"vel_l2_sq"(i64 %t443, i64 %t444, i64 %t445)
  store i64 %t446, ptr %local.energy.341
  %t447 = load i64, ptr %local.l3_val.335
  %t448 = load i64, ptr %local.sup_l3.329
  %t449 = call i64 @"sx_f64_gt"(i64 %t447, i64 %t448)
  %t450 = icmp ne i64 %t449, 0
  br i1 %t450, label %then11, label %else11
then11:
  %t451 = load i64, ptr %local.l3_val.335
  store i64 %t451, ptr %local.sup_l3.329
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t452 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t453 = load i64, ptr %local.enst.340
  %t454 = load i64, ptr %local.sup_enst.332
  %t455 = call i64 @"sx_f64_gt"(i64 %t453, i64 %t454)
  %t456 = icmp ne i64 %t455, 0
  br i1 %t456, label %then12, label %else12
then12:
  %t457 = load i64, ptr %local.enst.340
  store i64 %t457, ptr %local.sup_enst.332
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t458 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t459 = load i64, ptr %local.energy.341
  %t460 = load i64, ptr %local.sup_energy.333
  %t461 = call i64 @"sx_f64_gt"(i64 %t459, i64 %t460)
  %t462 = icmp ne i64 %t461, 0
  br i1 %t462, label %then13, label %else13
then13:
  %t463 = load i64, ptr %local.energy.341
  store i64 %t463, ptr %local.sup_energy.333
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t464 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t465 = load i64, ptr %local.int_l6_4.330
  %t466 = load i64, ptr %local.l6_4.337
  %t467 = load i64, ptr %local.dt
  %t468 = call i64 @"sx_f64_mul"(i64 %t466, i64 %t467)
  %t469 = call i64 @"sx_f64_add"(i64 %t465, i64 %t468)
  store i64 %t469, ptr %local.int_l6_4.330
  %t470 = load i64, ptr %local.int_bkm.331
  %t471 = load i64, ptr %local.bkm_sq.339
  %t472 = load i64, ptr %local.dt
  %t473 = call i64 @"sx_f64_mul"(i64 %t471, i64 %t472)
  %t474 = call i64 @"sx_f64_add"(i64 %t470, i64 %t473)
  store i64 %t474, ptr %local.int_bkm.331
  %t475 = load i64, ptr %local.enst.340
  %t476 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.33)
  %t477 = call i64 @"sx_f64_gt"(i64 %t475, i64 %t476)
  %t478 = icmp ne i64 %t477, 0
  br i1 %t478, label %then14, label %else14
then14:
  %t479 = load i64, ptr %local.query
  %t480 = icmp eq i64 %t479, 0
  %t481 = zext i1 %t480 to i64
  %t482 = icmp ne i64 %t481, 0
  br i1 %t482, label %then15, label %else15
then15:
  %t483 = load i64, ptr %local.sup_l3.329
  ret i64 %t483
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t484 = phi i64 [ 0, %else15_end ]
  %t485 = load i64, ptr %local.query
  %t486 = icmp eq i64 %t485, 1
  %t487 = zext i1 %t486 to i64
  %t488 = icmp ne i64 %t487, 0
  br i1 %t488, label %then16, label %else16
then16:
  %t489 = load i64, ptr %local.int_l6_4.330
  ret i64 %t489
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t490 = phi i64 [ 0, %else16_end ]
  %t491 = load i64, ptr %local.query
  %t492 = icmp eq i64 %t491, 2
  %t493 = zext i1 %t492 to i64
  %t494 = icmp ne i64 %t493, 0
  br i1 %t494, label %then17, label %else17
then17:
  %t495 = load i64, ptr %local.int_bkm.331
  ret i64 %t495
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t496 = phi i64 [ 0, %else17_end ]
  %t497 = load i64, ptr %local.query
  %t498 = icmp eq i64 %t497, 3
  %t499 = zext i1 %t498 to i64
  %t500 = icmp ne i64 %t499, 0
  br i1 %t500, label %then18, label %else18
then18:
  %t501 = load i64, ptr %local.sup_enst.332
  ret i64 %t501
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t502 = phi i64 [ 0, %else18_end ]
  %t503 = load i64, ptr %local.sup_energy.333
  ret i64 %t503
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t504 = phi i64 [ 0, %else14_end ]
  %t505 = load i64, ptr %local.u.323
  %t506 = load i64, ptr %local.v.324
  %t507 = load i64, ptr %local.w.325
  %t508 = load i64, ptr %local.ox.326
  %t509 = load i64, ptr %local.oy.327
  %t510 = load i64, ptr %local.oz.328
  %t511 = load i64, ptr %local.nu
  %t512 = load i64, ptr %local.sigma
  %t513 = load i64, ptr %local.lambda
  %t514 = load i64, ptr %local.lambda2
  %t515 = load i64, ptr %local.dt
  %t516 = call i64 @"step6"(i64 %t505, i64 %t506, i64 %t507, i64 %t508, i64 %t509, i64 %t510, i64 %t511, i64 %t512, i64 %t513, i64 %t514, i64 %t515, i64 0)
  store i64 %t516, ptr %local.n0.342
  %t517 = load i64, ptr %local.u.323
  %t518 = load i64, ptr %local.v.324
  %t519 = load i64, ptr %local.w.325
  %t520 = load i64, ptr %local.ox.326
  %t521 = load i64, ptr %local.oy.327
  %t522 = load i64, ptr %local.oz.328
  %t523 = load i64, ptr %local.nu
  %t524 = load i64, ptr %local.sigma
  %t525 = load i64, ptr %local.lambda
  %t526 = load i64, ptr %local.lambda2
  %t527 = load i64, ptr %local.dt
  %t528 = call i64 @"step6"(i64 %t517, i64 %t518, i64 %t519, i64 %t520, i64 %t521, i64 %t522, i64 %t523, i64 %t524, i64 %t525, i64 %t526, i64 %t527, i64 1)
  store i64 %t528, ptr %local.n1.343
  %t529 = load i64, ptr %local.u.323
  %t530 = load i64, ptr %local.v.324
  %t531 = load i64, ptr %local.w.325
  %t532 = load i64, ptr %local.ox.326
  %t533 = load i64, ptr %local.oy.327
  %t534 = load i64, ptr %local.oz.328
  %t535 = load i64, ptr %local.nu
  %t536 = load i64, ptr %local.sigma
  %t537 = load i64, ptr %local.lambda
  %t538 = load i64, ptr %local.lambda2
  %t539 = load i64, ptr %local.dt
  %t540 = call i64 @"step6"(i64 %t529, i64 %t530, i64 %t531, i64 %t532, i64 %t533, i64 %t534, i64 %t535, i64 %t536, i64 %t537, i64 %t538, i64 %t539, i64 2)
  store i64 %t540, ptr %local.n2.344
  %t541 = load i64, ptr %local.u.323
  %t542 = load i64, ptr %local.v.324
  %t543 = load i64, ptr %local.w.325
  %t544 = load i64, ptr %local.ox.326
  %t545 = load i64, ptr %local.oy.327
  %t546 = load i64, ptr %local.oz.328
  %t547 = load i64, ptr %local.nu
  %t548 = load i64, ptr %local.sigma
  %t549 = load i64, ptr %local.lambda
  %t550 = load i64, ptr %local.lambda2
  %t551 = load i64, ptr %local.dt
  %t552 = call i64 @"step6"(i64 %t541, i64 %t542, i64 %t543, i64 %t544, i64 %t545, i64 %t546, i64 %t547, i64 %t548, i64 %t549, i64 %t550, i64 %t551, i64 3)
  store i64 %t552, ptr %local.n3.345
  %t553 = load i64, ptr %local.u.323
  %t554 = load i64, ptr %local.v.324
  %t555 = load i64, ptr %local.w.325
  %t556 = load i64, ptr %local.ox.326
  %t557 = load i64, ptr %local.oy.327
  %t558 = load i64, ptr %local.oz.328
  %t559 = load i64, ptr %local.nu
  %t560 = load i64, ptr %local.sigma
  %t561 = load i64, ptr %local.lambda
  %t562 = load i64, ptr %local.lambda2
  %t563 = load i64, ptr %local.dt
  %t564 = call i64 @"step6"(i64 %t553, i64 %t554, i64 %t555, i64 %t556, i64 %t557, i64 %t558, i64 %t559, i64 %t560, i64 %t561, i64 %t562, i64 %t563, i64 4)
  store i64 %t564, ptr %local.n4.346
  %t565 = load i64, ptr %local.u.323
  %t566 = load i64, ptr %local.v.324
  %t567 = load i64, ptr %local.w.325
  %t568 = load i64, ptr %local.ox.326
  %t569 = load i64, ptr %local.oy.327
  %t570 = load i64, ptr %local.oz.328
  %t571 = load i64, ptr %local.nu
  %t572 = load i64, ptr %local.sigma
  %t573 = load i64, ptr %local.lambda
  %t574 = load i64, ptr %local.lambda2
  %t575 = load i64, ptr %local.dt
  %t576 = call i64 @"step6"(i64 %t565, i64 %t566, i64 %t567, i64 %t568, i64 %t569, i64 %t570, i64 %t571, i64 %t572, i64 %t573, i64 %t574, i64 %t575, i64 5)
  store i64 %t576, ptr %local.n5.347
  %t577 = load i64, ptr %local.n0.342
  store i64 %t577, ptr %local.u.323
  %t578 = load i64, ptr %local.n1.343
  store i64 %t578, ptr %local.v.324
  %t579 = load i64, ptr %local.n2.344
  store i64 %t579, ptr %local.w.325
  %t580 = load i64, ptr %local.n3.345
  store i64 %t580, ptr %local.ox.326
  %t581 = load i64, ptr %local.n4.346
  store i64 %t581, ptr %local.oy.327
  %t582 = load i64, ptr %local.n5.347
  store i64 %t582, ptr %local.oz.328
  %t583 = load i64, ptr %local.s.334
  %t584 = add i64 %t583, 1
  store i64 %t584, ptr %local.s.334
  br label %loop10
endloop10:
  %t585 = load i64, ptr %local.query
  %t586 = icmp eq i64 %t585, 0
  %t587 = zext i1 %t586 to i64
  %t588 = icmp ne i64 %t587, 0
  br i1 %t588, label %then19, label %else19
then19:
  %t589 = load i64, ptr %local.sup_l3.329
  ret i64 %t589
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t590 = phi i64 [ 0, %else19_end ]
  %t591 = load i64, ptr %local.query
  %t592 = icmp eq i64 %t591, 1
  %t593 = zext i1 %t592 to i64
  %t594 = icmp ne i64 %t593, 0
  br i1 %t594, label %then20, label %else20
then20:
  %t595 = load i64, ptr %local.int_l6_4.330
  ret i64 %t595
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t596 = phi i64 [ 0, %else20_end ]
  %t597 = load i64, ptr %local.query
  %t598 = icmp eq i64 %t597, 2
  %t599 = zext i1 %t598 to i64
  %t600 = icmp ne i64 %t599, 0
  br i1 %t600, label %then21, label %else21
then21:
  %t601 = load i64, ptr %local.int_bkm.331
  ret i64 %t601
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t602 = phi i64 [ 0, %else21_end ]
  %t603 = load i64, ptr %local.query
  %t604 = icmp eq i64 %t603, 3
  %t605 = zext i1 %t604 to i64
  %t606 = icmp ne i64 %t605, 0
  br i1 %t606, label %then22, label %else22
then22:
  %t607 = load i64, ptr %local.sup_enst.332
  ret i64 %t607
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t608 = phi i64 [ 0, %else22_end ]
  %t609 = load i64, ptr %local.sup_energy.333
  ret i64 %t609
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.nu.610 = alloca i64
  %local.sigma.611 = alloca i64
  %local.lambda.612 = alloca i64
  %local.lambda2.613 = alloca i64
  %local.dt.614 = alloca i64
  %local.max_steps.615 = alloca i64
  %local.amp_idx.616 = alloca i64
  %local.amp.617 = alloca i64
  %local.ps1.618 = alloca i64
  %local.ps2.619 = alloca i64
  %local.ps3.620 = alloca i64
  %local.enst.621 = alloca i64
  %local.amp_safe.622 = alloca i64
  %local.pi.623 = alloca i64
  %local.u.624 = alloca i64
  %local.v.625 = alloca i64
  %local.w.626 = alloca i64
  %local.ox.627 = alloca i64
  %local.oy.628 = alloca i64
  %local.oz.629 = alloca i64
  %local.s.630 = alloca i64
  %local.max_l3.631 = alloca i64
  %local.max_bkm.632 = alloca i64
  %local.l3.633 = alloca i64
  %local.bkm.634 = alloca i64
  %local.enst.635 = alloca i64
  %local.energy.636 = alloca i64
  %local.time.637 = alloca i64
  %local.n0.638 = alloca i64
  %local.n1.639 = alloca i64
  %local.n2.640 = alloca i64
  %local.n3.641 = alloca i64
  %local.n4.642 = alloca i64
  %local.n5.643 = alloca i64
  %local.baseline_ps.644 = alloca i64
  %local.scale_idx.645 = alloca i64
  %local.a_test.646 = alloca i64
  %local.ps_val.647 = alloca i64
  %local.ratio.648 = alloca i64
  %t649 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.34)
  store i64 %t649, ptr %local.nu.610
  %t650 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.35)
  store i64 %t650, ptr %local.sigma.611
  %t651 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.36)
  store i64 %t651, ptr %local.lambda.612
  %t652 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.37)
  store i64 %t652, ptr %local.lambda2.613
  %t653 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.38)
  store i64 %t653, ptr %local.dt.614
  store i64 50000, ptr %local.max_steps.615
  %t654 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.39)
  %t655 = ptrtoint ptr %t654 to i64
  %t656 = inttoptr i64 %t655 to ptr
  call void @intrinsic_println(ptr %t656)
  %t657 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.40)
  %t658 = ptrtoint ptr %t657 to i64
  %t659 = inttoptr i64 %t658 to ptr
  call void @intrinsic_println(ptr %t659)
  %t660 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.41)
  %t661 = ptrtoint ptr %t660 to i64
  %t662 = inttoptr i64 %t661 to ptr
  call void @intrinsic_println(ptr %t662)
  %t663 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.42)
  %t664 = ptrtoint ptr %t663 to i64
  %t665 = inttoptr i64 %t664 to ptr
  call void @intrinsic_println(ptr %t665)
  %t666 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.43)
  %t667 = ptrtoint ptr %t666 to i64
  %t668 = inttoptr i64 %t667 to ptr
  call void @intrinsic_println(ptr %t668)
  %t669 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.44)
  %t670 = ptrtoint ptr %t669 to i64
  %t671 = inttoptr i64 %t670 to ptr
  call void @intrinsic_println(ptr %t671)
  %t672 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.45)
  %t673 = ptrtoint ptr %t672 to i64
  %t674 = inttoptr i64 %t673 to ptr
  call void @intrinsic_println(ptr %t674)
  %t675 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.46)
  %t676 = ptrtoint ptr %t675 to i64
  %t677 = inttoptr i64 %t676 to ptr
  call void @intrinsic_println(ptr %t677)
  %t678 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.47)
  %t679 = ptrtoint ptr %t678 to i64
  %t680 = inttoptr i64 %t679 to ptr
  call void @intrinsic_println(ptr %t680)
  %t681 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.48)
  %t682 = ptrtoint ptr %t681 to i64
  %t683 = inttoptr i64 %t682 to ptr
  call void @intrinsic_println(ptr %t683)
  %t684 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.49)
  %t685 = ptrtoint ptr %t684 to i64
  %t686 = inttoptr i64 %t685 to ptr
  call void @intrinsic_println(ptr %t686)
  %t687 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.50)
  %t688 = ptrtoint ptr %t687 to i64
  %t689 = inttoptr i64 %t688 to ptr
  call void @intrinsic_println(ptr %t689)
  %t690 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.51)
  %t691 = ptrtoint ptr %t690 to i64
  %t692 = inttoptr i64 %t691 to ptr
  call void @intrinsic_println(ptr %t692)
  %t693 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.52)
  %t694 = ptrtoint ptr %t693 to i64
  %t695 = inttoptr i64 %t694 to ptr
  call void @intrinsic_println(ptr %t695)
  %t696 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.53)
  %t697 = ptrtoint ptr %t696 to i64
  %t698 = inttoptr i64 %t697 to ptr
  call void @intrinsic_println(ptr %t698)
  %t699 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.54)
  %t700 = ptrtoint ptr %t699 to i64
  %t701 = inttoptr i64 %t700 to ptr
  call void @intrinsic_println(ptr %t701)
  %t702 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.55)
  %t703 = ptrtoint ptr %t702 to i64
  %t704 = inttoptr i64 %t703 to ptr
  call void @intrinsic_println(ptr %t704)
  %t705 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.56)
  %t706 = ptrtoint ptr %t705 to i64
  %t707 = inttoptr i64 %t706 to ptr
  call void @intrinsic_println(ptr %t707)
  store i64 0, ptr %local.amp_idx.616
  br label %loop23
loop23:
  %t708 = load i64, ptr %local.amp_idx.616
  %t709 = icmp slt i64 %t708, 12
  %t710 = zext i1 %t709 to i64
  %t711 = icmp ne i64 %t710, 0
  br i1 %t711, label %body23, label %endloop23
body23:
  %t712 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.57)
  store i64 %t712, ptr %local.amp.617
  %t713 = load i64, ptr %local.amp_idx.616
  %t714 = icmp eq i64 %t713, 0
  %t715 = zext i1 %t714 to i64
  %t716 = icmp ne i64 %t715, 0
  br i1 %t716, label %then24, label %else24
then24:
  %t717 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.58)
  store i64 %t717, ptr %local.amp.617
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t718 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t719 = load i64, ptr %local.amp_idx.616
  %t720 = icmp eq i64 %t719, 1
  %t721 = zext i1 %t720 to i64
  %t722 = icmp ne i64 %t721, 0
  br i1 %t722, label %then25, label %else25
then25:
  %t723 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.59)
  store i64 %t723, ptr %local.amp.617
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t724 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t725 = load i64, ptr %local.amp_idx.616
  %t726 = icmp eq i64 %t725, 2
  %t727 = zext i1 %t726 to i64
  %t728 = icmp ne i64 %t727, 0
  br i1 %t728, label %then26, label %else26
then26:
  %t729 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.60)
  store i64 %t729, ptr %local.amp.617
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t730 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t731 = load i64, ptr %local.amp_idx.616
  %t732 = icmp eq i64 %t731, 3
  %t733 = zext i1 %t732 to i64
  %t734 = icmp ne i64 %t733, 0
  br i1 %t734, label %then27, label %else27
then27:
  %t735 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.61)
  store i64 %t735, ptr %local.amp.617
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t736 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t737 = load i64, ptr %local.amp_idx.616
  %t738 = icmp eq i64 %t737, 4
  %t739 = zext i1 %t738 to i64
  %t740 = icmp ne i64 %t739, 0
  br i1 %t740, label %then28, label %else28
then28:
  %t741 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.62)
  store i64 %t741, ptr %local.amp.617
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t742 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t743 = load i64, ptr %local.amp_idx.616
  %t744 = icmp eq i64 %t743, 5
  %t745 = zext i1 %t744 to i64
  %t746 = icmp ne i64 %t745, 0
  br i1 %t746, label %then29, label %else29
then29:
  %t747 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.63)
  store i64 %t747, ptr %local.amp.617
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t748 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t749 = load i64, ptr %local.amp_idx.616
  %t750 = icmp eq i64 %t749, 6
  %t751 = zext i1 %t750 to i64
  %t752 = icmp ne i64 %t751, 0
  br i1 %t752, label %then30, label %else30
then30:
  %t753 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.64)
  store i64 %t753, ptr %local.amp.617
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t754 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t755 = load i64, ptr %local.amp_idx.616
  %t756 = icmp eq i64 %t755, 7
  %t757 = zext i1 %t756 to i64
  %t758 = icmp ne i64 %t757, 0
  br i1 %t758, label %then31, label %else31
then31:
  %t759 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.65)
  store i64 %t759, ptr %local.amp.617
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t760 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t761 = load i64, ptr %local.amp_idx.616
  %t762 = icmp eq i64 %t761, 8
  %t763 = zext i1 %t762 to i64
  %t764 = icmp ne i64 %t763, 0
  br i1 %t764, label %then32, label %else32
then32:
  %t765 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.66)
  store i64 %t765, ptr %local.amp.617
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t766 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t767 = load i64, ptr %local.amp_idx.616
  %t768 = icmp eq i64 %t767, 9
  %t769 = zext i1 %t768 to i64
  %t770 = icmp ne i64 %t769, 0
  br i1 %t770, label %then33, label %else33
then33:
  %t771 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.67)
  store i64 %t771, ptr %local.amp.617
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t772 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t773 = load i64, ptr %local.amp_idx.616
  %t774 = icmp eq i64 %t773, 10
  %t775 = zext i1 %t774 to i64
  %t776 = icmp ne i64 %t775, 0
  br i1 %t776, label %then34, label %else34
then34:
  %t777 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.68)
  store i64 %t777, ptr %local.amp.617
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t778 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t779 = load i64, ptr %local.amp_idx.616
  %t780 = icmp eq i64 %t779, 11
  %t781 = zext i1 %t780 to i64
  %t782 = icmp ne i64 %t781, 0
  br i1 %t782, label %then35, label %else35
then35:
  %t783 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.69)
  store i64 %t783, ptr %local.amp.617
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t784 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t785 = load i64, ptr %local.amp.617
  %t786 = load i64, ptr %local.nu.610
  %t787 = load i64, ptr %local.sigma.611
  %t788 = load i64, ptr %local.lambda.612
  %t789 = load i64, ptr %local.lambda2.613
  %t790 = load i64, ptr %local.dt.614
  %t791 = load i64, ptr %local.max_steps.615
  %t792 = call i64 @"run_ps"(i64 %t785, i64 %t786, i64 %t787, i64 %t788, i64 %t789, i64 %t790, i64 %t791, i64 0)
  store i64 %t792, ptr %local.ps1.618
  %t793 = load i64, ptr %local.amp.617
  %t794 = load i64, ptr %local.nu.610
  %t795 = load i64, ptr %local.sigma.611
  %t796 = load i64, ptr %local.lambda.612
  %t797 = load i64, ptr %local.lambda2.613
  %t798 = load i64, ptr %local.dt.614
  %t799 = load i64, ptr %local.max_steps.615
  %t800 = call i64 @"run_ps"(i64 %t793, i64 %t794, i64 %t795, i64 %t796, i64 %t797, i64 %t798, i64 %t799, i64 1)
  store i64 %t800, ptr %local.ps2.619
  %t801 = load i64, ptr %local.amp.617
  %t802 = load i64, ptr %local.nu.610
  %t803 = load i64, ptr %local.sigma.611
  %t804 = load i64, ptr %local.lambda.612
  %t805 = load i64, ptr %local.lambda2.613
  %t806 = load i64, ptr %local.dt.614
  %t807 = load i64, ptr %local.max_steps.615
  %t808 = call i64 @"run_ps"(i64 %t801, i64 %t802, i64 %t803, i64 %t804, i64 %t805, i64 %t806, i64 %t807, i64 2)
  store i64 %t808, ptr %local.ps3.620
  %t809 = load i64, ptr %local.amp.617
  %t810 = load i64, ptr %local.nu.610
  %t811 = load i64, ptr %local.sigma.611
  %t812 = load i64, ptr %local.lambda.612
  %t813 = load i64, ptr %local.lambda2.613
  %t814 = load i64, ptr %local.dt.614
  %t815 = load i64, ptr %local.max_steps.615
  %t816 = call i64 @"run_ps"(i64 %t809, i64 %t810, i64 %t811, i64 %t812, i64 %t813, i64 %t814, i64 %t815, i64 3)
  store i64 %t816, ptr %local.enst.621
  %t817 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.70)
  %t818 = ptrtoint ptr %t817 to i64
  %t819 = inttoptr i64 %t818 to ptr
  call void @intrinsic_print(ptr %t819)
  %t820 = load i64, ptr %local.amp.617
  %t821 = call i64 @"print_f64"(i64 %t820)
  %t822 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.71)
  %t823 = ptrtoint ptr %t822 to i64
  %t824 = inttoptr i64 %t823 to ptr
  call void @intrinsic_print(ptr %t824)
  %t825 = load i64, ptr %local.ps1.618
  %t826 = call i64 @"print_f64"(i64 %t825)
  %t827 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.72)
  %t828 = ptrtoint ptr %t827 to i64
  %t829 = inttoptr i64 %t828 to ptr
  call void @intrinsic_print(ptr %t829)
  %t830 = load i64, ptr %local.ps2.619
  %t831 = call i64 @"print_f64"(i64 %t830)
  %t832 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.73)
  %t833 = ptrtoint ptr %t832 to i64
  %t834 = inttoptr i64 %t833 to ptr
  call void @intrinsic_print(ptr %t834)
  %t835 = load i64, ptr %local.ps3.620
  %t836 = call i64 @"print_f64"(i64 %t835)
  %t837 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.74)
  %t838 = ptrtoint ptr %t837 to i64
  %t839 = inttoptr i64 %t838 to ptr
  call void @intrinsic_print(ptr %t839)
  %t840 = load i64, ptr %local.enst.621
  %t841 = call i64 @"print_f64"(i64 %t840)
  %t842 = load i64, ptr %local.enst.621
  %t843 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.75)
  %t844 = call i64 @"sx_f64_lt"(i64 %t842, i64 %t843)
  %t845 = icmp ne i64 %t844, 0
  br i1 %t845, label %then36, label %else36
then36:
  %t846 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.76)
  %t847 = ptrtoint ptr %t846 to i64
  %t848 = inttoptr i64 %t847 to ptr
  call void @intrinsic_println(ptr %t848)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  %t849 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.77)
  %t850 = ptrtoint ptr %t849 to i64
  %t851 = inttoptr i64 %t850 to ptr
  call void @intrinsic_println(ptr %t851)
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t852 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t853 = load i64, ptr %local.amp_idx.616
  %t854 = add i64 %t853, 1
  store i64 %t854, ptr %local.amp_idx.616
  br label %loop23
endloop23:
  %t855 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.78)
  %t856 = ptrtoint ptr %t855 to i64
  %t857 = inttoptr i64 %t856 to ptr
  call void @intrinsic_println(ptr %t857)
  %t858 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.79)
  %t859 = ptrtoint ptr %t858 to i64
  %t860 = inttoptr i64 %t859 to ptr
  call void @intrinsic_println(ptr %t860)
  %t861 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.80)
  %t862 = ptrtoint ptr %t861 to i64
  %t863 = inttoptr i64 %t862 to ptr
  call void @intrinsic_println(ptr %t863)
  %t864 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.81)
  %t865 = ptrtoint ptr %t864 to i64
  %t866 = inttoptr i64 %t865 to ptr
  call void @intrinsic_println(ptr %t866)
  %t867 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.82)
  %t868 = ptrtoint ptr %t867 to i64
  %t869 = inttoptr i64 %t868 to ptr
  call void @intrinsic_println(ptr %t869)
  %t870 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.83)
  store i64 %t870, ptr %local.amp_safe.622
  %t871 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.84)
  store i64 %t871, ptr %local.pi.623
  %t872 = load i64, ptr %local.amp_safe.622
  %t873 = load i64, ptr %local.pi.623
  %t874 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.85)
  %t875 = call i64 @"sx_f64_mul"(i64 %t873, i64 %t874)
  %t876 = call i64 @"sin_f64"(i64 %t875)
  %t877 = call i64 @"sx_f64_mul"(i64 %t872, i64 %t876)
  store i64 %t877, ptr %local.u.624
  %t878 = load i64, ptr %local.amp_safe.622
  %t879 = load i64, ptr %local.pi.623
  %t880 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.86)
  %t881 = call i64 @"sx_f64_mul"(i64 %t879, i64 %t880)
  %t882 = call i64 @"sin_f64"(i64 %t881)
  %t883 = call i64 @"sx_f64_mul"(i64 %t878, i64 %t882)
  store i64 %t883, ptr %local.v.625
  %t884 = load i64, ptr %local.amp_safe.622
  %t885 = load i64, ptr %local.pi.623
  %t886 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.87)
  %t887 = call i64 @"sx_f64_mul"(i64 %t885, i64 %t886)
  %t888 = call i64 @"sin_f64"(i64 %t887)
  %t889 = call i64 @"sx_f64_mul"(i64 %t884, i64 %t888)
  store i64 %t889, ptr %local.w.626
  %t890 = load i64, ptr %local.amp_safe.622
  %t891 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.88)
  %t892 = call i64 @"sx_f64_mul"(i64 %t890, i64 %t891)
  %t893 = load i64, ptr %local.pi.623
  %t894 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.89)
  %t895 = call i64 @"sx_f64_mul"(i64 %t893, i64 %t894)
  %t896 = call i64 @"sin_f64"(i64 %t895)
  %t897 = call i64 @"sx_f64_mul"(i64 %t892, i64 %t896)
  store i64 %t897, ptr %local.ox.627
  %t898 = load i64, ptr %local.amp_safe.622
  %t899 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.90)
  %t900 = call i64 @"sx_f64_mul"(i64 %t898, i64 %t899)
  %t901 = load i64, ptr %local.pi.623
  %t902 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.91)
  %t903 = call i64 @"sx_f64_mul"(i64 %t901, i64 %t902)
  %t904 = call i64 @"sin_f64"(i64 %t903)
  %t905 = call i64 @"sx_f64_mul"(i64 %t900, i64 %t904)
  store i64 %t905, ptr %local.oy.628
  %t906 = load i64, ptr %local.amp_safe.622
  %t907 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.92)
  %t908 = call i64 @"sx_f64_mul"(i64 %t906, i64 %t907)
  %t909 = load i64, ptr %local.pi.623
  %t910 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.93)
  %t911 = call i64 @"sx_f64_mul"(i64 %t909, i64 %t910)
  %t912 = call i64 @"sin_f64"(i64 %t911)
  %t913 = call i64 @"sx_f64_mul"(i64 %t908, i64 %t912)
  store i64 %t913, ptr %local.oz.629
  store i64 0, ptr %local.s.630
  %t914 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.94)
  store i64 %t914, ptr %local.max_l3.631
  %t915 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.95)
  store i64 %t915, ptr %local.max_bkm.632
  br label %loop37
loop37:
  %t916 = load i64, ptr %local.s.630
  %t917 = load i64, ptr %local.max_steps.615
  %t918 = icmp slt i64 %t916, %t917
  %t919 = zext i1 %t918 to i64
  %t920 = icmp ne i64 %t919, 0
  br i1 %t920, label %body37, label %endloop37
body37:
  %t921 = load i64, ptr %local.s.630
  %t922 = srem i64 %t921, 5000
  %t923 = icmp eq i64 %t922, 0
  %t924 = zext i1 %t923 to i64
  %t925 = icmp ne i64 %t924, 0
  br i1 %t925, label %then38, label %else38
then38:
  %t926 = load i64, ptr %local.u.624
  %t927 = load i64, ptr %local.v.625
  %t928 = load i64, ptr %local.w.626
  %t929 = call i64 @"vel_l3_cubed"(i64 %t926, i64 %t927, i64 %t928)
  store i64 %t929, ptr %local.l3.633
  %t930 = load i64, ptr %local.ox.627
  %t931 = load i64, ptr %local.oy.628
  %t932 = load i64, ptr %local.oz.629
  %t933 = call i64 @"vort_linf"(i64 %t930, i64 %t931, i64 %t932)
  %t934 = load i64, ptr %local.ox.627
  %t935 = load i64, ptr %local.oy.628
  %t936 = load i64, ptr %local.oz.629
  %t937 = call i64 @"vort_linf"(i64 %t934, i64 %t935, i64 %t936)
  %t938 = call i64 @"sx_f64_mul"(i64 %t933, i64 %t937)
  store i64 %t938, ptr %local.bkm.634
  %t939 = load i64, ptr %local.ox.627
  %t940 = load i64, ptr %local.oy.628
  %t941 = load i64, ptr %local.oz.629
  %t942 = call i64 @"enstrophy"(i64 %t939, i64 %t940, i64 %t941)
  store i64 %t942, ptr %local.enst.635
  %t943 = load i64, ptr %local.u.624
  %t944 = load i64, ptr %local.v.625
  %t945 = load i64, ptr %local.w.626
  %t946 = call i64 @"vel_l2_sq"(i64 %t943, i64 %t944, i64 %t945)
  store i64 %t946, ptr %local.energy.636
  %t947 = load i64, ptr %local.l3.633
  %t948 = load i64, ptr %local.max_l3.631
  %t949 = call i64 @"sx_f64_gt"(i64 %t947, i64 %t948)
  %t950 = icmp ne i64 %t949, 0
  br i1 %t950, label %then39, label %else39
then39:
  %t951 = load i64, ptr %local.l3.633
  store i64 %t951, ptr %local.max_l3.631
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t952 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t953 = load i64, ptr %local.bkm.634
  %t954 = load i64, ptr %local.max_bkm.632
  %t955 = call i64 @"sx_f64_gt"(i64 %t953, i64 %t954)
  %t956 = icmp ne i64 %t955, 0
  br i1 %t956, label %then40, label %else40
then40:
  %t957 = load i64, ptr %local.bkm.634
  store i64 %t957, ptr %local.max_bkm.632
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t958 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t959 = load i64, ptr %local.s.630
  %t960 = call i64 @"sx_int_to_f64"(i64 %t959)
  %t961 = load i64, ptr %local.dt.614
  %t962 = call i64 @"sx_f64_mul"(i64 %t960, i64 %t961)
  store i64 %t962, ptr %local.time.637
  %t963 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.96)
  %t964 = ptrtoint ptr %t963 to i64
  %t965 = inttoptr i64 %t964 to ptr
  call void @intrinsic_print(ptr %t965)
  %t966 = load i64, ptr %local.time.637
  %t967 = call i64 @"print_f64"(i64 %t966)
  %t968 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.97)
  %t969 = ptrtoint ptr %t968 to i64
  %t970 = inttoptr i64 %t969 to ptr
  call void @intrinsic_print(ptr %t970)
  %t971 = load i64, ptr %local.l3.633
  %t972 = call i64 @"print_f64"(i64 %t971)
  %t973 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.98)
  %t974 = ptrtoint ptr %t973 to i64
  %t975 = inttoptr i64 %t974 to ptr
  call void @intrinsic_print(ptr %t975)
  %t976 = load i64, ptr %local.bkm.634
  %t977 = call i64 @"print_f64"(i64 %t976)
  %t978 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.99)
  %t979 = ptrtoint ptr %t978 to i64
  %t980 = inttoptr i64 %t979 to ptr
  call void @intrinsic_print(ptr %t980)
  %t981 = load i64, ptr %local.enst.635
  %t982 = call i64 @"print_f64"(i64 %t981)
  %t983 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.100)
  %t984 = ptrtoint ptr %t983 to i64
  %t985 = inttoptr i64 %t984 to ptr
  call void @intrinsic_print(ptr %t985)
  %t986 = load i64, ptr %local.energy.636
  %t987 = call i64 @"print_f64"(i64 %t986)
  %t988 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.101)
  %t989 = ptrtoint ptr %t988 to i64
  %t990 = inttoptr i64 %t989 to ptr
  call void @intrinsic_println(ptr %t990)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t991 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t992 = load i64, ptr %local.u.624
  %t993 = load i64, ptr %local.v.625
  %t994 = load i64, ptr %local.w.626
  %t995 = load i64, ptr %local.ox.627
  %t996 = load i64, ptr %local.oy.628
  %t997 = load i64, ptr %local.oz.629
  %t998 = load i64, ptr %local.nu.610
  %t999 = load i64, ptr %local.sigma.611
  %t1000 = load i64, ptr %local.lambda.612
  %t1001 = load i64, ptr %local.lambda2.613
  %t1002 = load i64, ptr %local.dt.614
  %t1003 = call i64 @"step6"(i64 %t992, i64 %t993, i64 %t994, i64 %t995, i64 %t996, i64 %t997, i64 %t998, i64 %t999, i64 %t1000, i64 %t1001, i64 %t1002, i64 0)
  store i64 %t1003, ptr %local.n0.638
  %t1004 = load i64, ptr %local.u.624
  %t1005 = load i64, ptr %local.v.625
  %t1006 = load i64, ptr %local.w.626
  %t1007 = load i64, ptr %local.ox.627
  %t1008 = load i64, ptr %local.oy.628
  %t1009 = load i64, ptr %local.oz.629
  %t1010 = load i64, ptr %local.nu.610
  %t1011 = load i64, ptr %local.sigma.611
  %t1012 = load i64, ptr %local.lambda.612
  %t1013 = load i64, ptr %local.lambda2.613
  %t1014 = load i64, ptr %local.dt.614
  %t1015 = call i64 @"step6"(i64 %t1004, i64 %t1005, i64 %t1006, i64 %t1007, i64 %t1008, i64 %t1009, i64 %t1010, i64 %t1011, i64 %t1012, i64 %t1013, i64 %t1014, i64 1)
  store i64 %t1015, ptr %local.n1.639
  %t1016 = load i64, ptr %local.u.624
  %t1017 = load i64, ptr %local.v.625
  %t1018 = load i64, ptr %local.w.626
  %t1019 = load i64, ptr %local.ox.627
  %t1020 = load i64, ptr %local.oy.628
  %t1021 = load i64, ptr %local.oz.629
  %t1022 = load i64, ptr %local.nu.610
  %t1023 = load i64, ptr %local.sigma.611
  %t1024 = load i64, ptr %local.lambda.612
  %t1025 = load i64, ptr %local.lambda2.613
  %t1026 = load i64, ptr %local.dt.614
  %t1027 = call i64 @"step6"(i64 %t1016, i64 %t1017, i64 %t1018, i64 %t1019, i64 %t1020, i64 %t1021, i64 %t1022, i64 %t1023, i64 %t1024, i64 %t1025, i64 %t1026, i64 2)
  store i64 %t1027, ptr %local.n2.640
  %t1028 = load i64, ptr %local.u.624
  %t1029 = load i64, ptr %local.v.625
  %t1030 = load i64, ptr %local.w.626
  %t1031 = load i64, ptr %local.ox.627
  %t1032 = load i64, ptr %local.oy.628
  %t1033 = load i64, ptr %local.oz.629
  %t1034 = load i64, ptr %local.nu.610
  %t1035 = load i64, ptr %local.sigma.611
  %t1036 = load i64, ptr %local.lambda.612
  %t1037 = load i64, ptr %local.lambda2.613
  %t1038 = load i64, ptr %local.dt.614
  %t1039 = call i64 @"step6"(i64 %t1028, i64 %t1029, i64 %t1030, i64 %t1031, i64 %t1032, i64 %t1033, i64 %t1034, i64 %t1035, i64 %t1036, i64 %t1037, i64 %t1038, i64 3)
  store i64 %t1039, ptr %local.n3.641
  %t1040 = load i64, ptr %local.u.624
  %t1041 = load i64, ptr %local.v.625
  %t1042 = load i64, ptr %local.w.626
  %t1043 = load i64, ptr %local.ox.627
  %t1044 = load i64, ptr %local.oy.628
  %t1045 = load i64, ptr %local.oz.629
  %t1046 = load i64, ptr %local.nu.610
  %t1047 = load i64, ptr %local.sigma.611
  %t1048 = load i64, ptr %local.lambda.612
  %t1049 = load i64, ptr %local.lambda2.613
  %t1050 = load i64, ptr %local.dt.614
  %t1051 = call i64 @"step6"(i64 %t1040, i64 %t1041, i64 %t1042, i64 %t1043, i64 %t1044, i64 %t1045, i64 %t1046, i64 %t1047, i64 %t1048, i64 %t1049, i64 %t1050, i64 4)
  store i64 %t1051, ptr %local.n4.642
  %t1052 = load i64, ptr %local.u.624
  %t1053 = load i64, ptr %local.v.625
  %t1054 = load i64, ptr %local.w.626
  %t1055 = load i64, ptr %local.ox.627
  %t1056 = load i64, ptr %local.oy.628
  %t1057 = load i64, ptr %local.oz.629
  %t1058 = load i64, ptr %local.nu.610
  %t1059 = load i64, ptr %local.sigma.611
  %t1060 = load i64, ptr %local.lambda.612
  %t1061 = load i64, ptr %local.lambda2.613
  %t1062 = load i64, ptr %local.dt.614
  %t1063 = call i64 @"step6"(i64 %t1052, i64 %t1053, i64 %t1054, i64 %t1055, i64 %t1056, i64 %t1057, i64 %t1058, i64 %t1059, i64 %t1060, i64 %t1061, i64 %t1062, i64 5)
  store i64 %t1063, ptr %local.n5.643
  %t1064 = load i64, ptr %local.n0.638
  store i64 %t1064, ptr %local.u.624
  %t1065 = load i64, ptr %local.n1.639
  store i64 %t1065, ptr %local.v.625
  %t1066 = load i64, ptr %local.n2.640
  store i64 %t1066, ptr %local.w.626
  %t1067 = load i64, ptr %local.n3.641
  store i64 %t1067, ptr %local.ox.627
  %t1068 = load i64, ptr %local.n4.642
  store i64 %t1068, ptr %local.oy.628
  %t1069 = load i64, ptr %local.n5.643
  store i64 %t1069, ptr %local.oz.629
  %t1070 = load i64, ptr %local.s.630
  %t1071 = add i64 %t1070, 1
  store i64 %t1071, ptr %local.s.630
  br label %loop37
endloop37:
  %t1072 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.102)
  %t1073 = ptrtoint ptr %t1072 to i64
  %t1074 = inttoptr i64 %t1073 to ptr
  call void @intrinsic_println(ptr %t1074)
  %t1075 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.103)
  %t1076 = ptrtoint ptr %t1075 to i64
  %t1077 = inttoptr i64 %t1076 to ptr
  call void @intrinsic_print(ptr %t1077)
  %t1078 = load i64, ptr %local.max_l3.631
  %t1079 = call i64 @"print_f64"(i64 %t1078)
  %t1080 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.104)
  %t1081 = ptrtoint ptr %t1080 to i64
  %t1082 = inttoptr i64 %t1081 to ptr
  call void @intrinsic_println(ptr %t1082)
  %t1083 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.105)
  %t1084 = ptrtoint ptr %t1083 to i64
  %t1085 = inttoptr i64 %t1084 to ptr
  call void @intrinsic_print(ptr %t1085)
  %t1086 = load i64, ptr %local.max_bkm.632
  %t1087 = call i64 @"print_f64"(i64 %t1086)
  %t1088 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.106)
  %t1089 = ptrtoint ptr %t1088 to i64
  %t1090 = inttoptr i64 %t1089 to ptr
  call void @intrinsic_println(ptr %t1090)
  %t1091 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.107)
  %t1092 = ptrtoint ptr %t1091 to i64
  %t1093 = inttoptr i64 %t1092 to ptr
  call void @intrinsic_println(ptr %t1093)
  %t1094 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.108)
  %t1095 = ptrtoint ptr %t1094 to i64
  %t1096 = inttoptr i64 %t1095 to ptr
  call void @intrinsic_println(ptr %t1096)
  %t1097 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.109)
  %t1098 = ptrtoint ptr %t1097 to i64
  %t1099 = inttoptr i64 %t1098 to ptr
  call void @intrinsic_println(ptr %t1099)
  %t1100 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.110)
  %t1101 = ptrtoint ptr %t1100 to i64
  %t1102 = inttoptr i64 %t1101 to ptr
  call void @intrinsic_println(ptr %t1102)
  %t1103 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.111)
  %t1104 = ptrtoint ptr %t1103 to i64
  %t1105 = inttoptr i64 %t1104 to ptr
  call void @intrinsic_println(ptr %t1105)
  %t1106 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.112)
  %t1107 = load i64, ptr %local.nu.610
  %t1108 = load i64, ptr %local.sigma.611
  %t1109 = load i64, ptr %local.lambda.612
  %t1110 = load i64, ptr %local.lambda2.613
  %t1111 = load i64, ptr %local.dt.614
  %t1112 = load i64, ptr %local.max_steps.615
  %t1113 = call i64 @"run_ps"(i64 %t1106, i64 %t1107, i64 %t1108, i64 %t1109, i64 %t1110, i64 %t1111, i64 %t1112, i64 0)
  store i64 %t1113, ptr %local.baseline_ps.644
  store i64 0, ptr %local.scale_idx.645
  br label %loop41
loop41:
  %t1114 = load i64, ptr %local.scale_idx.645
  %t1115 = icmp slt i64 %t1114, 8
  %t1116 = zext i1 %t1115 to i64
  %t1117 = icmp ne i64 %t1116, 0
  br i1 %t1117, label %body41, label %endloop41
body41:
  %t1118 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.113)
  store i64 %t1118, ptr %local.a_test.646
  %t1119 = load i64, ptr %local.scale_idx.645
  %t1120 = icmp eq i64 %t1119, 0
  %t1121 = zext i1 %t1120 to i64
  %t1122 = icmp ne i64 %t1121, 0
  br i1 %t1122, label %then42, label %else42
then42:
  %t1123 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.114)
  store i64 %t1123, ptr %local.a_test.646
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1124 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t1125 = load i64, ptr %local.scale_idx.645
  %t1126 = icmp eq i64 %t1125, 1
  %t1127 = zext i1 %t1126 to i64
  %t1128 = icmp ne i64 %t1127, 0
  br i1 %t1128, label %then43, label %else43
then43:
  %t1129 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.115)
  store i64 %t1129, ptr %local.a_test.646
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1130 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t1131 = load i64, ptr %local.scale_idx.645
  %t1132 = icmp eq i64 %t1131, 2
  %t1133 = zext i1 %t1132 to i64
  %t1134 = icmp ne i64 %t1133, 0
  br i1 %t1134, label %then44, label %else44
then44:
  %t1135 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.116)
  store i64 %t1135, ptr %local.a_test.646
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1136 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t1137 = load i64, ptr %local.scale_idx.645
  %t1138 = icmp eq i64 %t1137, 3
  %t1139 = zext i1 %t1138 to i64
  %t1140 = icmp ne i64 %t1139, 0
  br i1 %t1140, label %then45, label %else45
then45:
  %t1141 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.117)
  store i64 %t1141, ptr %local.a_test.646
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1142 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t1143 = load i64, ptr %local.scale_idx.645
  %t1144 = icmp eq i64 %t1143, 4
  %t1145 = zext i1 %t1144 to i64
  %t1146 = icmp ne i64 %t1145, 0
  br i1 %t1146, label %then46, label %else46
then46:
  %t1147 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.118)
  store i64 %t1147, ptr %local.a_test.646
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1148 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t1149 = load i64, ptr %local.scale_idx.645
  %t1150 = icmp eq i64 %t1149, 5
  %t1151 = zext i1 %t1150 to i64
  %t1152 = icmp ne i64 %t1151, 0
  br i1 %t1152, label %then47, label %else47
then47:
  %t1153 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.119)
  store i64 %t1153, ptr %local.a_test.646
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1154 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t1155 = load i64, ptr %local.scale_idx.645
  %t1156 = icmp eq i64 %t1155, 6
  %t1157 = zext i1 %t1156 to i64
  %t1158 = icmp ne i64 %t1157, 0
  br i1 %t1158, label %then48, label %else48
then48:
  %t1159 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.120)
  store i64 %t1159, ptr %local.a_test.646
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1160 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1161 = load i64, ptr %local.scale_idx.645
  %t1162 = icmp eq i64 %t1161, 7
  %t1163 = zext i1 %t1162 to i64
  %t1164 = icmp ne i64 %t1163, 0
  br i1 %t1164, label %then49, label %else49
then49:
  %t1165 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.121)
  store i64 %t1165, ptr %local.a_test.646
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1166 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t1167 = load i64, ptr %local.a_test.646
  %t1168 = load i64, ptr %local.nu.610
  %t1169 = load i64, ptr %local.sigma.611
  %t1170 = load i64, ptr %local.lambda.612
  %t1171 = load i64, ptr %local.lambda2.613
  %t1172 = load i64, ptr %local.dt.614
  %t1173 = load i64, ptr %local.max_steps.615
  %t1174 = call i64 @"run_ps"(i64 %t1167, i64 %t1168, i64 %t1169, i64 %t1170, i64 %t1171, i64 %t1172, i64 %t1173, i64 0)
  store i64 %t1174, ptr %local.ps_val.647
  %t1175 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.122)
  store i64 %t1175, ptr %local.ratio.648
  %t1176 = load i64, ptr %local.baseline_ps.644
  %t1177 = call i64 @f64_parse(ptr @.str.exp_ns_prodi_serrin.123)
  %t1178 = call i64 @"sx_f64_gt"(i64 %t1176, i64 %t1177)
  %t1179 = icmp ne i64 %t1178, 0
  br i1 %t1179, label %then50, label %else50
then50:
  %t1180 = load i64, ptr %local.ps_val.647
  %t1181 = load i64, ptr %local.baseline_ps.644
  %t1182 = call i64 @"sx_f64_div"(i64 %t1180, i64 %t1181)
  store i64 %t1182, ptr %local.ratio.648
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1183 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t1184 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.124)
  %t1185 = ptrtoint ptr %t1184 to i64
  %t1186 = inttoptr i64 %t1185 to ptr
  call void @intrinsic_print(ptr %t1186)
  %t1187 = load i64, ptr %local.a_test.646
  %t1188 = call i64 @"print_f64"(i64 %t1187)
  %t1189 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.125)
  %t1190 = ptrtoint ptr %t1189 to i64
  %t1191 = inttoptr i64 %t1190 to ptr
  call void @intrinsic_print(ptr %t1191)
  %t1192 = load i64, ptr %local.ps_val.647
  %t1193 = call i64 @"print_f64"(i64 %t1192)
  %t1194 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.126)
  %t1195 = ptrtoint ptr %t1194 to i64
  %t1196 = inttoptr i64 %t1195 to ptr
  call void @intrinsic_print(ptr %t1196)
  %t1197 = load i64, ptr %local.ratio.648
  %t1198 = call i64 @"print_f64"(i64 %t1197)
  %t1199 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.127)
  %t1200 = ptrtoint ptr %t1199 to i64
  %t1201 = inttoptr i64 %t1200 to ptr
  call void @intrinsic_println(ptr %t1201)
  %t1202 = load i64, ptr %local.scale_idx.645
  %t1203 = add i64 %t1202, 1
  store i64 %t1203, ptr %local.scale_idx.645
  br label %loop41
endloop41:
  %t1204 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.128)
  %t1205 = ptrtoint ptr %t1204 to i64
  %t1206 = inttoptr i64 %t1205 to ptr
  call void @intrinsic_println(ptr %t1206)
  %t1207 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.129)
  %t1208 = ptrtoint ptr %t1207 to i64
  %t1209 = inttoptr i64 %t1208 to ptr
  call void @intrinsic_println(ptr %t1209)
  %t1210 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.130)
  %t1211 = ptrtoint ptr %t1210 to i64
  %t1212 = inttoptr i64 %t1211 to ptr
  call void @intrinsic_println(ptr %t1212)
  %t1213 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.131)
  %t1214 = ptrtoint ptr %t1213 to i64
  %t1215 = inttoptr i64 %t1214 to ptr
  call void @intrinsic_println(ptr %t1215)
  %t1216 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.132)
  %t1217 = ptrtoint ptr %t1216 to i64
  %t1218 = inttoptr i64 %t1217 to ptr
  call void @intrinsic_println(ptr %t1218)
  %t1219 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.133)
  %t1220 = ptrtoint ptr %t1219 to i64
  %t1221 = inttoptr i64 %t1220 to ptr
  call void @intrinsic_println(ptr %t1221)
  %t1222 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.134)
  %t1223 = ptrtoint ptr %t1222 to i64
  %t1224 = inttoptr i64 %t1223 to ptr
  call void @intrinsic_println(ptr %t1224)
  %t1225 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.135)
  %t1226 = ptrtoint ptr %t1225 to i64
  %t1227 = inttoptr i64 %t1226 to ptr
  call void @intrinsic_println(ptr %t1227)
  %t1228 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.136)
  %t1229 = ptrtoint ptr %t1228 to i64
  %t1230 = inttoptr i64 %t1229 to ptr
  call void @intrinsic_println(ptr %t1230)
  %t1231 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.137)
  %t1232 = ptrtoint ptr %t1231 to i64
  %t1233 = inttoptr i64 %t1232 to ptr
  call void @intrinsic_println(ptr %t1233)
  %t1234 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.138)
  %t1235 = ptrtoint ptr %t1234 to i64
  %t1236 = inttoptr i64 %t1235 to ptr
  call void @intrinsic_println(ptr %t1236)
  %t1237 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.139)
  %t1238 = ptrtoint ptr %t1237 to i64
  %t1239 = inttoptr i64 %t1238 to ptr
  call void @intrinsic_println(ptr %t1239)
  %t1240 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.140)
  %t1241 = ptrtoint ptr %t1240 to i64
  %t1242 = inttoptr i64 %t1241 to ptr
  call void @intrinsic_println(ptr %t1242)
  %t1243 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.141)
  %t1244 = ptrtoint ptr %t1243 to i64
  %t1245 = inttoptr i64 %t1244 to ptr
  call void @intrinsic_println(ptr %t1245)
  %t1246 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.142)
  %t1247 = ptrtoint ptr %t1246 to i64
  %t1248 = inttoptr i64 %t1247 to ptr
  call void @intrinsic_println(ptr %t1248)
  %t1249 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.143)
  %t1250 = ptrtoint ptr %t1249 to i64
  %t1251 = inttoptr i64 %t1250 to ptr
  call void @intrinsic_println(ptr %t1251)
  %t1252 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.144)
  %t1253 = ptrtoint ptr %t1252 to i64
  %t1254 = inttoptr i64 %t1253 to ptr
  call void @intrinsic_println(ptr %t1254)
  %t1255 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.145)
  %t1256 = ptrtoint ptr %t1255 to i64
  %t1257 = inttoptr i64 %t1256 to ptr
  call void @intrinsic_println(ptr %t1257)
  %t1258 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.146)
  %t1259 = ptrtoint ptr %t1258 to i64
  %t1260 = inttoptr i64 %t1259 to ptr
  call void @intrinsic_println(ptr %t1260)
  %t1261 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.147)
  %t1262 = ptrtoint ptr %t1261 to i64
  %t1263 = inttoptr i64 %t1262 to ptr
  call void @intrinsic_println(ptr %t1263)
  %t1264 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.148)
  %t1265 = ptrtoint ptr %t1264 to i64
  %t1266 = inttoptr i64 %t1265 to ptr
  call void @intrinsic_println(ptr %t1266)
  %t1267 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.149)
  %t1268 = ptrtoint ptr %t1267 to i64
  %t1269 = inttoptr i64 %t1268 to ptr
  call void @intrinsic_println(ptr %t1269)
  %t1270 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.150)
  %t1271 = ptrtoint ptr %t1270 to i64
  %t1272 = inttoptr i64 %t1271 to ptr
  call void @intrinsic_println(ptr %t1272)
  %t1273 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_prodi_serrin.151)
  %t1274 = ptrtoint ptr %t1273 to i64
  %t1275 = inttoptr i64 %t1274 to ptr
  call void @intrinsic_println(ptr %t1275)
  ret i64 0
}


; String constants
@.str.exp_ns_prodi_serrin.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.4 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_prodi_serrin.5 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_prodi_serrin.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.7 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_prodi_serrin.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.9 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_prodi_serrin.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.11 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_prodi_serrin.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.13 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_prodi_serrin.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.15 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_prodi_serrin.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.17 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_prodi_serrin.18 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_prodi_serrin.19 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_prodi_serrin.20 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_prodi_serrin.21 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_prodi_serrin.22 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.23 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_prodi_serrin.24 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.25 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_prodi_serrin.26 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.27 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_prodi_serrin.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.33 = private unnamed_addr constant [9 x i8] c"100000.0\00"
@.str.exp_ns_prodi_serrin.34 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_prodi_serrin.35 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_prodi_serrin.36 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_prodi_serrin.37 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_ns_prodi_serrin.38 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_prodi_serrin.39 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_prodi_serrin.40 = private unnamed_addr constant [62 x i8] c"#  PRODI-SERRIN: Regularity via Classical Criteria          #\00"
@.str.exp_ns_prodi_serrin.41 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_prodi_serrin.42 = private unnamed_addr constant [61 x i8] c"#  Prodi (1959), Serrin (1962):                            #\00"
@.str.exp_ns_prodi_serrin.43 = private unnamed_addr constant [61 x i8] c"#    u in L^p_t L^q_x with 2/p + 3/q <= 1 → regular      #\00"
@.str.exp_ns_prodi_serrin.44 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_prodi_serrin.45 = private unnamed_addr constant [60 x i8] c"#  We compute three Prodi-Serrin norms along scaffold     #\00"
@.str.exp_ns_prodi_serrin.46 = private unnamed_addr constant [60 x i8] c"#  trajectories and verify they are bounded below A*.     #\00"
@.str.exp_ns_prodi_serrin.47 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_prodi_serrin.48 = private unnamed_addr constant [63 x i8] c"#  If scaffold contraction → PS bounded → regularity:    #\00"
@.str.exp_ns_prodi_serrin.49 = private unnamed_addr constant [61 x i8] c"#    Arrow 1: computational (this experiment)              #\00"
@.str.exp_ns_prodi_serrin.50 = private unnamed_addr constant [60 x i8] c"#    Arrow 2: analytical theorem (Prodi-Serrin 1959/62)   #\00"
@.str.exp_ns_prodi_serrin.51 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_prodi_serrin.52 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.53 = private unnamed_addr constant [51 x i8] c"  === Phase 1: Prodi-Serrin norms vs amplitude ===\00"
@.str.exp_ns_prodi_serrin.54 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.55 = private unnamed_addr constant [77 x i8] c"  A      sup||u||^3_3   int||u||^4_6   int||w||^2_inf  sup(Enst)    Bounded?\00"
@.str.exp_ns_prodi_serrin.56 = private unnamed_addr constant [77 x i8] c"  ----   -----------    -----------    -----------     ----------   --------\00"
@.str.exp_ns_prodi_serrin.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.58 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.59 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_prodi_serrin.60 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_prodi_serrin.61 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_prodi_serrin.62 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_prodi_serrin.63 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_ns_prodi_serrin.64 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_ns_prodi_serrin.65 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_prodi_serrin.66 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_prodi_serrin.67 = private unnamed_addr constant [5 x i8] c"1.15\00"
@.str.exp_ns_prodi_serrin.68 = private unnamed_addr constant [4 x i8] c"1.2\00"
@.str.exp_ns_prodi_serrin.69 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_prodi_serrin.70 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_prodi_serrin.71 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.72 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.73 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.74 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.75 = private unnamed_addr constant [9 x i8] c"100000.0\00"
@.str.exp_ns_prodi_serrin.76 = private unnamed_addr constant [7 x i8] c"   YES\00"
@.str.exp_ns_prodi_serrin.77 = private unnamed_addr constant [11 x i8] c"   BLOW-UP\00"
@.str.exp_ns_prodi_serrin.78 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.79 = private unnamed_addr constant [56 x i8] c"  === Phase 2: PS norms over time (A=0.5, below A*) ===\00"
@.str.exp_ns_prodi_serrin.80 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.81 = private unnamed_addr constant [60 x i8] c"  Time     ||u||^3_3     ||w||^2_inf   Enstrophy     Energy\00"
@.str.exp_ns_prodi_serrin.82 = private unnamed_addr constant [64 x i8] c"  ------   ----------    ----------    ----------    ----------\00"
@.str.exp_ns_prodi_serrin.83 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_prodi_serrin.84 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_prodi_serrin.85 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_prodi_serrin.86 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_prodi_serrin.87 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_prodi_serrin.88 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.89 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_prodi_serrin.90 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.91 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_prodi_serrin.92 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.93 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_prodi_serrin.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.95 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.96 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_prodi_serrin.97 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.98 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.99 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.100 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.102 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.103 = private unnamed_addr constant [25 x i8] c"  Final max ||u||^3_3 = \00"
@.str.exp_ns_prodi_serrin.104 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.105 = private unnamed_addr constant [27 x i8] c"  Final max ||w||^2_inf = \00"
@.str.exp_ns_prodi_serrin.106 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.107 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.108 = private unnamed_addr constant [54 x i8] c"  === Phase 3: Scaling of PS norms with amplitude ===\00"
@.str.exp_ns_prodi_serrin.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.110 = private unnamed_addr constant [41 x i8] c"  A        sup||u||^3_3   Ratio to A=0.1\00"
@.str.exp_ns_prodi_serrin.111 = private unnamed_addr constant [41 x i8] c"  ------   -----------    --------------\00"
@.str.exp_ns_prodi_serrin.112 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.113 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.114 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_prodi_serrin.115 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_prodi_serrin.116 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_prodi_serrin.117 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_prodi_serrin.118 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_prodi_serrin.119 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_prodi_serrin.120 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_prodi_serrin.121 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_prodi_serrin.122 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.123 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_prodi_serrin.124 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_prodi_serrin.125 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.126 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_prodi_serrin.127 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.128 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.129 = private unnamed_addr constant [30 x i8] c"  === Phase 4: Assessment ===\00"
@.str.exp_ns_prodi_serrin.130 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.131 = private unnamed_addr constant [37 x i8] c"  The Prodi-Serrin condition states:\00"
@.str.exp_ns_prodi_serrin.132 = private unnamed_addr constant [53 x i8] c"    u in L^p_t L^q_x with 2/p + 3/q <= 1 → REGULAR\00"
@.str.exp_ns_prodi_serrin.133 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.134 = private unnamed_addr constant [40 x i8] c"  If ALL PS norms are bounded below A*:\00"
@.str.exp_ns_prodi_serrin.135 = private unnamed_addr constant [52 x i8] c"    → Scaffold contraction FORCES PS satisfaction\00"
@.str.exp_ns_prodi_serrin.136 = private unnamed_addr constant [52 x i8] c"    → PS satisfaction → regularity (by theorem)\00"
@.str.exp_ns_prodi_serrin.137 = private unnamed_addr constant [44 x i8] c"    → Scaffold contraction → regularity\00"
@.str.exp_ns_prodi_serrin.138 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.139 = private unnamed_addr constant [44 x i8] c"  This bridges computational to analytical:\00"
@.str.exp_ns_prodi_serrin.140 = private unnamed_addr constant [47 x i8] c"    Step 1: Scaffold contracts (6 experiments)\00"
@.str.exp_ns_prodi_serrin.141 = private unnamed_addr constant [63 x i8] c"    Step 2: Contraction → PS norms bounded (this experiment)\00"
@.str.exp_ns_prodi_serrin.142 = private unnamed_addr constant [61 x i8] c"    Step 3: PS bounded → regular (Prodi 1959, Serrin 1962)\00"
@.str.exp_ns_prodi_serrin.143 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.144 = private unnamed_addr constant [63 x i8] c"  The chain is: COMPUTATIONAL → COMPUTATIONAL → ANALYTICAL\00"
@.str.exp_ns_prodi_serrin.145 = private unnamed_addr constant [55 x i8] c"  To make Step 2 analytical, show that the contraction\00"
@.str.exp_ns_prodi_serrin.146 = private unnamed_addr constant [59 x i8] c"  rate of the bootstrap implies ||u||_{L^3} ≤ C(A*, nu).\00"
@.str.exp_ns_prodi_serrin.147 = private unnamed_addr constant [62 x i8] c"  This is a Sobolev embedding applied to the enstrophy bound.\00"
@.str.exp_ns_prodi_serrin.148 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_prodi_serrin.149 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_prodi_serrin.150 = private unnamed_addr constant [61 x i8] c"#  PRODI-SERRIN COMPLETE                                   #\00"
@.str.exp_ns_prodi_serrin.151 = private unnamed_addr constant [61 x i8] c"############################################################\00"
