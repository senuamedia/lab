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
  %t1 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.1)
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

define i64 @"dot4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t22 = load i64, ptr %local.a0
  %t23 = load i64, ptr %local.b0
  %t24 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t23)
  %t25 = load i64, ptr %local.a1
  %t26 = load i64, ptr %local.b1
  %t27 = call i64 @"sx_f64_mul"(i64 %t25, i64 %t26)
  %t28 = call i64 @"sx_f64_add"(i64 %t24, i64 %t27)
  %t29 = load i64, ptr %local.a2
  %t30 = load i64, ptr %local.b2
  %t31 = call i64 @"sx_f64_mul"(i64 %t29, i64 %t30)
  %t32 = call i64 @"sx_f64_add"(i64 %t28, i64 %t31)
  %t33 = load i64, ptr %local.a3
  %t34 = load i64, ptr %local.b3
  %t35 = call i64 @"sx_f64_mul"(i64 %t33, i64 %t34)
  %t36 = call i64 @"sx_f64_add"(i64 %t32, i64 %t35)
  ret i64 %t36
}

define i64 @"norm4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %t37 = load i64, ptr %local.a0
  %t38 = load i64, ptr %local.a1
  %t39 = load i64, ptr %local.a2
  %t40 = load i64, ptr %local.a3
  %t41 = load i64, ptr %local.a0
  %t42 = load i64, ptr %local.a1
  %t43 = load i64, ptr %local.a2
  %t44 = load i64, ptr %local.a3
  %t45 = call i64 @"dot4"(i64 %t37, i64 %t38, i64 %t39, i64 %t40, i64 %t41, i64 %t42, i64 %t43, i64 %t44)
  %t46 = call i64 @"sqrt_f64"(i64 %t45)
  ret i64 %t46
}

define i64 @"cosine4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.d.47 = alloca i64
  %local.na.48 = alloca i64
  %local.nb.49 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t50 = load i64, ptr %local.a0
  %t51 = load i64, ptr %local.a1
  %t52 = load i64, ptr %local.a2
  %t53 = load i64, ptr %local.a3
  %t54 = load i64, ptr %local.b0
  %t55 = load i64, ptr %local.b1
  %t56 = load i64, ptr %local.b2
  %t57 = load i64, ptr %local.b3
  %t58 = call i64 @"dot4"(i64 %t50, i64 %t51, i64 %t52, i64 %t53, i64 %t54, i64 %t55, i64 %t56, i64 %t57)
  store i64 %t58, ptr %local.d.47
  %t59 = load i64, ptr %local.a0
  %t60 = load i64, ptr %local.a1
  %t61 = load i64, ptr %local.a2
  %t62 = load i64, ptr %local.a3
  %t63 = call i64 @"norm4"(i64 %t59, i64 %t60, i64 %t61, i64 %t62)
  store i64 %t63, ptr %local.na.48
  %t64 = load i64, ptr %local.b0
  %t65 = load i64, ptr %local.b1
  %t66 = load i64, ptr %local.b2
  %t67 = load i64, ptr %local.b3
  %t68 = call i64 @"norm4"(i64 %t64, i64 %t65, i64 %t66, i64 %t67)
  store i64 %t68, ptr %local.nb.49
  %t69 = load i64, ptr %local.d.47
  %t70 = load i64, ptr %local.na.48
  %t71 = load i64, ptr %local.nb.49
  %t72 = call i64 @"sx_f64_mul"(i64 %t70, i64 %t71)
  %t73 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.2)
  %t74 = call i64 @"sx_f64_add"(i64 %t72, i64 %t73)
  %t75 = call i64 @"sx_f64_div"(i64 %t69, i64 %t74)
  ret i64 %t75
}

define i64 @"project_dim"(i64 %gi, i64 %gj_0, i64 %gj_1, i64 %gj_2, i64 %gj_3, i64 %gi_0, i64 %gi_1, i64 %gi_2, i64 %gi_3, i64 %alpha, i64 %dim) nounwind {
entry:
  %local.cos_val.76 = alloca i64
  %local.scale.77 = alloca i64
  %local.gj_sq.78 = alloca i64
  %local.proj.79 = alloca i64
  %local.gi = alloca i64
  store i64 %gi, ptr %local.gi
  %local.gj_0 = alloca i64
  store i64 %gj_0, ptr %local.gj_0
  %local.gj_1 = alloca i64
  store i64 %gj_1, ptr %local.gj_1
  %local.gj_2 = alloca i64
  store i64 %gj_2, ptr %local.gj_2
  %local.gj_3 = alloca i64
  store i64 %gj_3, ptr %local.gj_3
  %local.gi_0 = alloca i64
  store i64 %gi_0, ptr %local.gi_0
  %local.gi_1 = alloca i64
  store i64 %gi_1, ptr %local.gi_1
  %local.gi_2 = alloca i64
  store i64 %gi_2, ptr %local.gi_2
  %local.gi_3 = alloca i64
  store i64 %gi_3, ptr %local.gi_3
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t80 = load i64, ptr %local.gi_0
  %t81 = load i64, ptr %local.gi_1
  %t82 = load i64, ptr %local.gi_2
  %t83 = load i64, ptr %local.gi_3
  %t84 = load i64, ptr %local.gj_0
  %t85 = load i64, ptr %local.gj_1
  %t86 = load i64, ptr %local.gj_2
  %t87 = load i64, ptr %local.gj_3
  %t88 = call i64 @"cosine4"(i64 %t80, i64 %t81, i64 %t82, i64 %t83, i64 %t84, i64 %t85, i64 %t86, i64 %t87)
  store i64 %t88, ptr %local.cos_val.76
  %t89 = load i64, ptr %local.cos_val.76
  %t90 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.3)
  %t91 = call i64 @"sx_f64_ge"(i64 %t89, i64 %t90)
  %t92 = icmp ne i64 %t91, 0
  br i1 %t92, label %then3, label %else3
then3:
  %t93 = load i64, ptr %local.gi
  ret i64 %t93
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t94 = phi i64 [ 0, %else3_end ]
  %t95 = load i64, ptr %local.alpha
  %t96 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.4)
  %t97 = load i64, ptr %local.cos_val.76
  %t98 = call i64 @"sx_f64_sub"(i64 %t96, i64 %t97)
  %t99 = call i64 @"sx_f64_mul"(i64 %t95, i64 %t98)
  store i64 %t99, ptr %local.scale.77
  %t100 = load i64, ptr %local.gj_0
  %t101 = load i64, ptr %local.gj_1
  %t102 = load i64, ptr %local.gj_2
  %t103 = load i64, ptr %local.gj_3
  %t104 = load i64, ptr %local.gj_0
  %t105 = load i64, ptr %local.gj_1
  %t106 = load i64, ptr %local.gj_2
  %t107 = load i64, ptr %local.gj_3
  %t108 = call i64 @"dot4"(i64 %t100, i64 %t101, i64 %t102, i64 %t103, i64 %t104, i64 %t105, i64 %t106, i64 %t107)
  %t109 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.5)
  %t110 = call i64 @"sx_f64_add"(i64 %t108, i64 %t109)
  store i64 %t110, ptr %local.gj_sq.78
  %t111 = load i64, ptr %local.scale.77
  %t112 = load i64, ptr %local.gi_0
  %t113 = load i64, ptr %local.gi_1
  %t114 = load i64, ptr %local.gi_2
  %t115 = load i64, ptr %local.gi_3
  %t116 = load i64, ptr %local.gj_0
  %t117 = load i64, ptr %local.gj_1
  %t118 = load i64, ptr %local.gj_2
  %t119 = load i64, ptr %local.gj_3
  %t120 = call i64 @"dot4"(i64 %t112, i64 %t113, i64 %t114, i64 %t115, i64 %t116, i64 %t117, i64 %t118, i64 %t119)
  %t121 = call i64 @"sx_f64_mul"(i64 %t111, i64 %t120)
  %t122 = load i64, ptr %local.gj_sq.78
  %t123 = call i64 @"sx_f64_div"(i64 %t121, i64 %t122)
  store i64 %t123, ptr %local.proj.79
  %t124 = load i64, ptr %local.dim
  %t125 = icmp eq i64 %t124, 0
  %t126 = zext i1 %t125 to i64
  %t127 = icmp ne i64 %t126, 0
  br i1 %t127, label %then4, label %else4
then4:
  %t128 = load i64, ptr %local.gi
  %t129 = load i64, ptr %local.proj.79
  %t130 = load i64, ptr %local.gj_0
  %t131 = call i64 @"sx_f64_mul"(i64 %t129, i64 %t130)
  %t132 = call i64 @"sx_f64_sub"(i64 %t128, i64 %t131)
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t133 = load i64, ptr %local.dim
  %t134 = icmp eq i64 %t133, 1
  %t135 = zext i1 %t134 to i64
  %t136 = icmp ne i64 %t135, 0
  br i1 %t136, label %then5, label %else5
then5:
  %t137 = load i64, ptr %local.gi
  %t138 = load i64, ptr %local.proj.79
  %t139 = load i64, ptr %local.gj_1
  %t140 = call i64 @"sx_f64_mul"(i64 %t138, i64 %t139)
  %t141 = call i64 @"sx_f64_sub"(i64 %t137, i64 %t140)
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t142 = load i64, ptr %local.dim
  %t143 = icmp eq i64 %t142, 2
  %t144 = zext i1 %t143 to i64
  %t145 = icmp ne i64 %t144, 0
  br i1 %t145, label %then6, label %else6
then6:
  %t146 = load i64, ptr %local.gi
  %t147 = load i64, ptr %local.proj.79
  %t148 = load i64, ptr %local.gj_2
  %t149 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t148)
  %t150 = call i64 @"sx_f64_sub"(i64 %t146, i64 %t149)
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t151 = load i64, ptr %local.gi
  %t152 = load i64, ptr %local.proj.79
  %t153 = load i64, ptr %local.gj_3
  %t154 = call i64 @"sx_f64_mul"(i64 %t152, i64 %t153)
  %t155 = call i64 @"sx_f64_sub"(i64 %t151, i64 %t154)
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t156 = phi i64 [ %t150, %then6_end ], [ %t155, %else6_end ]
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t157 = phi i64 [ %t141, %then5_end ], [ %t156, %else5_end ]
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t158 = phi i64 [ %t132, %then4_end ], [ %t157, %else4_end ]
  ret i64 %t158
}

define i64 @"loss4"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %t0, i64 %t1, i64 %t2, i64 %t3) nounwind {
entry:
  %local.d0.159 = alloca i64
  %local.d1.160 = alloca i64
  %local.d2.161 = alloca i64
  %local.d3.162 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.t0 = alloca i64
  store i64 %t0, ptr %local.t0
  %local.t1 = alloca i64
  store i64 %t1, ptr %local.t1
  %local.t2 = alloca i64
  store i64 %t2, ptr %local.t2
  %local.t3 = alloca i64
  store i64 %t3, ptr %local.t3
  %t163 = load i64, ptr %local.w0
  %t164 = load i64, ptr %local.t0
  %t165 = call i64 @"sx_f64_sub"(i64 %t163, i64 %t164)
  %t166 = load i64, ptr %local.w0
  %t167 = load i64, ptr %local.t0
  %t168 = call i64 @"sx_f64_sub"(i64 %t166, i64 %t167)
  %t169 = call i64 @"sx_f64_mul"(i64 %t165, i64 %t168)
  store i64 %t169, ptr %local.d0.159
  %t170 = load i64, ptr %local.w1
  %t171 = load i64, ptr %local.t1
  %t172 = call i64 @"sx_f64_sub"(i64 %t170, i64 %t171)
  %t173 = load i64, ptr %local.w1
  %t174 = load i64, ptr %local.t1
  %t175 = call i64 @"sx_f64_sub"(i64 %t173, i64 %t174)
  %t176 = call i64 @"sx_f64_mul"(i64 %t172, i64 %t175)
  store i64 %t176, ptr %local.d1.160
  %t177 = load i64, ptr %local.w2
  %t178 = load i64, ptr %local.t2
  %t179 = call i64 @"sx_f64_sub"(i64 %t177, i64 %t178)
  %t180 = load i64, ptr %local.w2
  %t181 = load i64, ptr %local.t2
  %t182 = call i64 @"sx_f64_sub"(i64 %t180, i64 %t181)
  %t183 = call i64 @"sx_f64_mul"(i64 %t179, i64 %t182)
  store i64 %t183, ptr %local.d2.161
  %t184 = load i64, ptr %local.w3
  %t185 = load i64, ptr %local.t3
  %t186 = call i64 @"sx_f64_sub"(i64 %t184, i64 %t185)
  %t187 = load i64, ptr %local.w3
  %t188 = load i64, ptr %local.t3
  %t189 = call i64 @"sx_f64_sub"(i64 %t187, i64 %t188)
  %t190 = call i64 @"sx_f64_mul"(i64 %t186, i64 %t189)
  store i64 %t190, ptr %local.d3.162
  %t191 = load i64, ptr %local.d0.159
  %t192 = load i64, ptr %local.d1.160
  %t193 = call i64 @"sx_f64_add"(i64 %t191, i64 %t192)
  %t194 = load i64, ptr %local.d2.161
  %t195 = call i64 @"sx_f64_add"(i64 %t193, i64 %t194)
  %t196 = load i64, ptr %local.d3.162
  %t197 = call i64 @"sx_f64_add"(i64 %t195, i64 %t196)
  ret i64 %t197
}

define i64 @"grad4"(i64 %w, i64 %t) nounwind {
entry:
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %t198 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.6)
  %t199 = load i64, ptr %local.w
  %t200 = load i64, ptr %local.t
  %t201 = call i64 @"sx_f64_sub"(i64 %t199, i64 %t200)
  %t202 = call i64 @"sx_f64_mul"(i64 %t198, i64 %t201)
  ret i64 %t202
}

define i64 @"exp1_run_cycle"(i64 %alpha_ab, i64 %alpha_ac, i64 %alpha_ba, i64 %alpha_bc, i64 %alpha_ca, i64 %alpha_cb, i64 %steps) nounwind {
entry:
  %local.w0.203 = alloca i64
  %local.w1.204 = alloca i64
  %local.w2.205 = alloca i64
  %local.w3.206 = alloca i64
  %local.step.207 = alloca i64
  %local.ga_0.208 = alloca i64
  %local.ga_1.209 = alloca i64
  %local.ga_2.210 = alloca i64
  %local.ga_3.211 = alloca i64
  %local.gb_0.212 = alloca i64
  %local.gb_1.213 = alloca i64
  %local.gb_2.214 = alloca i64
  %local.gb_3.215 = alloca i64
  %local.gc_0.216 = alloca i64
  %local.gc_1.217 = alloca i64
  %local.gc_2.218 = alloca i64
  %local.gc_3.219 = alloca i64
  %local.ra_0.220 = alloca i64
  %local.ra_1.221 = alloca i64
  %local.ra_2.222 = alloca i64
  %local.ra_3.223 = alloca i64
  %local.rb_0.224 = alloca i64
  %local.rb_1.225 = alloca i64
  %local.rb_2.226 = alloca i64
  %local.rb_3.227 = alloca i64
  %local.rc_0.228 = alloca i64
  %local.rc_1.229 = alloca i64
  %local.rc_2.230 = alloca i64
  %local.rc_3.231 = alloca i64
  %local.lr.232 = alloca i64
  %local.la.233 = alloca i64
  %local.lb.234 = alloca i64
  %local.lc.235 = alloca i64
  %local.alpha_ab = alloca i64
  store i64 %alpha_ab, ptr %local.alpha_ab
  %local.alpha_ac = alloca i64
  store i64 %alpha_ac, ptr %local.alpha_ac
  %local.alpha_ba = alloca i64
  store i64 %alpha_ba, ptr %local.alpha_ba
  %local.alpha_bc = alloca i64
  store i64 %alpha_bc, ptr %local.alpha_bc
  %local.alpha_ca = alloca i64
  store i64 %alpha_ca, ptr %local.alpha_ca
  %local.alpha_cb = alloca i64
  store i64 %alpha_cb, ptr %local.alpha_cb
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t236 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.7)
  store i64 %t236, ptr %local.w0.203
  %t237 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.8)
  store i64 %t237, ptr %local.w1.204
  %t238 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.9)
  store i64 %t238, ptr %local.w2.205
  %t239 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.10)
  store i64 %t239, ptr %local.w3.206
  store i64 0, ptr %local.step.207
  %t240 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.11)
  store i64 %t240, ptr %local.ga_0.208
  %t241 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.12)
  store i64 %t241, ptr %local.ga_1.209
  %t242 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.13)
  store i64 %t242, ptr %local.ga_2.210
  %t243 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.14)
  store i64 %t243, ptr %local.ga_3.211
  %t244 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.15)
  store i64 %t244, ptr %local.gb_0.212
  %t245 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.16)
  store i64 %t245, ptr %local.gb_1.213
  %t246 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.17)
  store i64 %t246, ptr %local.gb_2.214
  %t247 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.18)
  store i64 %t247, ptr %local.gb_3.215
  %t248 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.19)
  store i64 %t248, ptr %local.gc_0.216
  %t249 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.20)
  store i64 %t249, ptr %local.gc_1.217
  %t250 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.21)
  store i64 %t250, ptr %local.gc_2.218
  %t251 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.22)
  store i64 %t251, ptr %local.gc_3.219
  %t252 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.23)
  store i64 %t252, ptr %local.ra_0.220
  %t253 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.24)
  store i64 %t253, ptr %local.ra_1.221
  %t254 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.25)
  store i64 %t254, ptr %local.ra_2.222
  %t255 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.26)
  store i64 %t255, ptr %local.ra_3.223
  %t256 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.27)
  store i64 %t256, ptr %local.rb_0.224
  %t257 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.28)
  store i64 %t257, ptr %local.rb_1.225
  %t258 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.29)
  store i64 %t258, ptr %local.rb_2.226
  %t259 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.30)
  store i64 %t259, ptr %local.rb_3.227
  %t260 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.31)
  store i64 %t260, ptr %local.rc_0.228
  %t261 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.32)
  store i64 %t261, ptr %local.rc_1.229
  %t262 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.33)
  store i64 %t262, ptr %local.rc_2.230
  %t263 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.34)
  store i64 %t263, ptr %local.rc_3.231
  %t264 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.35)
  store i64 %t264, ptr %local.lr.232
  br label %loop7
loop7:
  %t265 = load i64, ptr %local.step.207
  %t266 = load i64, ptr %local.steps
  %t267 = icmp slt i64 %t265, %t266
  %t268 = zext i1 %t267 to i64
  %t269 = icmp ne i64 %t268, 0
  br i1 %t269, label %body7, label %endloop7
body7:
  %t270 = load i64, ptr %local.w0.203
  %t271 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.36)
  %t272 = call i64 @"grad4"(i64 %t270, i64 %t271)
  store i64 %t272, ptr %local.ga_0.208
  %t273 = load i64, ptr %local.w1.204
  %t274 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.37)
  %t275 = call i64 @"grad4"(i64 %t273, i64 %t274)
  store i64 %t275, ptr %local.ga_1.209
  %t276 = load i64, ptr %local.w2.205
  %t277 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.38)
  %t278 = call i64 @"grad4"(i64 %t276, i64 %t277)
  store i64 %t278, ptr %local.ga_2.210
  %t279 = load i64, ptr %local.w3.206
  %t280 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.39)
  %t281 = call i64 @"grad4"(i64 %t279, i64 %t280)
  store i64 %t281, ptr %local.ga_3.211
  %t282 = load i64, ptr %local.w0.203
  %t283 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.40)
  %t284 = call i64 @"grad4"(i64 %t282, i64 %t283)
  store i64 %t284, ptr %local.gb_0.212
  %t285 = load i64, ptr %local.w1.204
  %t286 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.41)
  %t287 = call i64 @"grad4"(i64 %t285, i64 %t286)
  store i64 %t287, ptr %local.gb_1.213
  %t288 = load i64, ptr %local.w2.205
  %t289 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.42)
  %t290 = call i64 @"grad4"(i64 %t288, i64 %t289)
  store i64 %t290, ptr %local.gb_2.214
  %t291 = load i64, ptr %local.w3.206
  %t292 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.43)
  %t293 = call i64 @"grad4"(i64 %t291, i64 %t292)
  store i64 %t293, ptr %local.gb_3.215
  %t294 = load i64, ptr %local.w0.203
  %t295 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.44)
  %t296 = call i64 @"grad4"(i64 %t294, i64 %t295)
  store i64 %t296, ptr %local.gc_0.216
  %t297 = load i64, ptr %local.w1.204
  %t298 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.45)
  %t299 = call i64 @"grad4"(i64 %t297, i64 %t298)
  store i64 %t299, ptr %local.gc_1.217
  %t300 = load i64, ptr %local.w2.205
  %t301 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.46)
  %t302 = call i64 @"grad4"(i64 %t300, i64 %t301)
  store i64 %t302, ptr %local.gc_2.218
  %t303 = load i64, ptr %local.w3.206
  %t304 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.47)
  %t305 = call i64 @"grad4"(i64 %t303, i64 %t304)
  store i64 %t305, ptr %local.gc_3.219
  %t306 = load i64, ptr %local.ga_0.208
  %t307 = load i64, ptr %local.gb_0.212
  %t308 = load i64, ptr %local.gb_1.213
  %t309 = load i64, ptr %local.gb_2.214
  %t310 = load i64, ptr %local.gb_3.215
  %t311 = load i64, ptr %local.ga_0.208
  %t312 = load i64, ptr %local.ga_1.209
  %t313 = load i64, ptr %local.ga_2.210
  %t314 = load i64, ptr %local.ga_3.211
  %t315 = load i64, ptr %local.alpha_ab
  %t316 = call i64 @"project_dim"(i64 %t306, i64 %t307, i64 %t308, i64 %t309, i64 %t310, i64 %t311, i64 %t312, i64 %t313, i64 %t314, i64 %t315, i64 0)
  store i64 %t316, ptr %local.ra_0.220
  %t317 = load i64, ptr %local.ra_0.220
  %t318 = load i64, ptr %local.gc_0.216
  %t319 = load i64, ptr %local.gc_1.217
  %t320 = load i64, ptr %local.gc_2.218
  %t321 = load i64, ptr %local.gc_3.219
  %t322 = load i64, ptr %local.ga_0.208
  %t323 = load i64, ptr %local.ga_1.209
  %t324 = load i64, ptr %local.ga_2.210
  %t325 = load i64, ptr %local.ga_3.211
  %t326 = load i64, ptr %local.alpha_ac
  %t327 = call i64 @"project_dim"(i64 %t317, i64 %t318, i64 %t319, i64 %t320, i64 %t321, i64 %t322, i64 %t323, i64 %t324, i64 %t325, i64 %t326, i64 0)
  store i64 %t327, ptr %local.ra_0.220
  %t328 = load i64, ptr %local.ga_1.209
  %t329 = load i64, ptr %local.gb_0.212
  %t330 = load i64, ptr %local.gb_1.213
  %t331 = load i64, ptr %local.gb_2.214
  %t332 = load i64, ptr %local.gb_3.215
  %t333 = load i64, ptr %local.ga_0.208
  %t334 = load i64, ptr %local.ga_1.209
  %t335 = load i64, ptr %local.ga_2.210
  %t336 = load i64, ptr %local.ga_3.211
  %t337 = load i64, ptr %local.alpha_ab
  %t338 = call i64 @"project_dim"(i64 %t328, i64 %t329, i64 %t330, i64 %t331, i64 %t332, i64 %t333, i64 %t334, i64 %t335, i64 %t336, i64 %t337, i64 1)
  store i64 %t338, ptr %local.ra_1.221
  %t339 = load i64, ptr %local.ra_1.221
  %t340 = load i64, ptr %local.gc_0.216
  %t341 = load i64, ptr %local.gc_1.217
  %t342 = load i64, ptr %local.gc_2.218
  %t343 = load i64, ptr %local.gc_3.219
  %t344 = load i64, ptr %local.ga_0.208
  %t345 = load i64, ptr %local.ga_1.209
  %t346 = load i64, ptr %local.ga_2.210
  %t347 = load i64, ptr %local.ga_3.211
  %t348 = load i64, ptr %local.alpha_ac
  %t349 = call i64 @"project_dim"(i64 %t339, i64 %t340, i64 %t341, i64 %t342, i64 %t343, i64 %t344, i64 %t345, i64 %t346, i64 %t347, i64 %t348, i64 1)
  store i64 %t349, ptr %local.ra_1.221
  %t350 = load i64, ptr %local.ga_2.210
  %t351 = load i64, ptr %local.gb_0.212
  %t352 = load i64, ptr %local.gb_1.213
  %t353 = load i64, ptr %local.gb_2.214
  %t354 = load i64, ptr %local.gb_3.215
  %t355 = load i64, ptr %local.ga_0.208
  %t356 = load i64, ptr %local.ga_1.209
  %t357 = load i64, ptr %local.ga_2.210
  %t358 = load i64, ptr %local.ga_3.211
  %t359 = load i64, ptr %local.alpha_ab
  %t360 = call i64 @"project_dim"(i64 %t350, i64 %t351, i64 %t352, i64 %t353, i64 %t354, i64 %t355, i64 %t356, i64 %t357, i64 %t358, i64 %t359, i64 2)
  store i64 %t360, ptr %local.ra_2.222
  %t361 = load i64, ptr %local.ra_2.222
  %t362 = load i64, ptr %local.gc_0.216
  %t363 = load i64, ptr %local.gc_1.217
  %t364 = load i64, ptr %local.gc_2.218
  %t365 = load i64, ptr %local.gc_3.219
  %t366 = load i64, ptr %local.ga_0.208
  %t367 = load i64, ptr %local.ga_1.209
  %t368 = load i64, ptr %local.ga_2.210
  %t369 = load i64, ptr %local.ga_3.211
  %t370 = load i64, ptr %local.alpha_ac
  %t371 = call i64 @"project_dim"(i64 %t361, i64 %t362, i64 %t363, i64 %t364, i64 %t365, i64 %t366, i64 %t367, i64 %t368, i64 %t369, i64 %t370, i64 2)
  store i64 %t371, ptr %local.ra_2.222
  %t372 = load i64, ptr %local.ga_3.211
  %t373 = load i64, ptr %local.gb_0.212
  %t374 = load i64, ptr %local.gb_1.213
  %t375 = load i64, ptr %local.gb_2.214
  %t376 = load i64, ptr %local.gb_3.215
  %t377 = load i64, ptr %local.ga_0.208
  %t378 = load i64, ptr %local.ga_1.209
  %t379 = load i64, ptr %local.ga_2.210
  %t380 = load i64, ptr %local.ga_3.211
  %t381 = load i64, ptr %local.alpha_ab
  %t382 = call i64 @"project_dim"(i64 %t372, i64 %t373, i64 %t374, i64 %t375, i64 %t376, i64 %t377, i64 %t378, i64 %t379, i64 %t380, i64 %t381, i64 3)
  store i64 %t382, ptr %local.ra_3.223
  %t383 = load i64, ptr %local.ra_3.223
  %t384 = load i64, ptr %local.gc_0.216
  %t385 = load i64, ptr %local.gc_1.217
  %t386 = load i64, ptr %local.gc_2.218
  %t387 = load i64, ptr %local.gc_3.219
  %t388 = load i64, ptr %local.ga_0.208
  %t389 = load i64, ptr %local.ga_1.209
  %t390 = load i64, ptr %local.ga_2.210
  %t391 = load i64, ptr %local.ga_3.211
  %t392 = load i64, ptr %local.alpha_ac
  %t393 = call i64 @"project_dim"(i64 %t383, i64 %t384, i64 %t385, i64 %t386, i64 %t387, i64 %t388, i64 %t389, i64 %t390, i64 %t391, i64 %t392, i64 3)
  store i64 %t393, ptr %local.ra_3.223
  %t394 = load i64, ptr %local.gb_0.212
  %t395 = load i64, ptr %local.ga_0.208
  %t396 = load i64, ptr %local.ga_1.209
  %t397 = load i64, ptr %local.ga_2.210
  %t398 = load i64, ptr %local.ga_3.211
  %t399 = load i64, ptr %local.gb_0.212
  %t400 = load i64, ptr %local.gb_1.213
  %t401 = load i64, ptr %local.gb_2.214
  %t402 = load i64, ptr %local.gb_3.215
  %t403 = load i64, ptr %local.alpha_ba
  %t404 = call i64 @"project_dim"(i64 %t394, i64 %t395, i64 %t396, i64 %t397, i64 %t398, i64 %t399, i64 %t400, i64 %t401, i64 %t402, i64 %t403, i64 0)
  store i64 %t404, ptr %local.rb_0.224
  %t405 = load i64, ptr %local.rb_0.224
  %t406 = load i64, ptr %local.gc_0.216
  %t407 = load i64, ptr %local.gc_1.217
  %t408 = load i64, ptr %local.gc_2.218
  %t409 = load i64, ptr %local.gc_3.219
  %t410 = load i64, ptr %local.gb_0.212
  %t411 = load i64, ptr %local.gb_1.213
  %t412 = load i64, ptr %local.gb_2.214
  %t413 = load i64, ptr %local.gb_3.215
  %t414 = load i64, ptr %local.alpha_bc
  %t415 = call i64 @"project_dim"(i64 %t405, i64 %t406, i64 %t407, i64 %t408, i64 %t409, i64 %t410, i64 %t411, i64 %t412, i64 %t413, i64 %t414, i64 0)
  store i64 %t415, ptr %local.rb_0.224
  %t416 = load i64, ptr %local.gb_1.213
  %t417 = load i64, ptr %local.ga_0.208
  %t418 = load i64, ptr %local.ga_1.209
  %t419 = load i64, ptr %local.ga_2.210
  %t420 = load i64, ptr %local.ga_3.211
  %t421 = load i64, ptr %local.gb_0.212
  %t422 = load i64, ptr %local.gb_1.213
  %t423 = load i64, ptr %local.gb_2.214
  %t424 = load i64, ptr %local.gb_3.215
  %t425 = load i64, ptr %local.alpha_ba
  %t426 = call i64 @"project_dim"(i64 %t416, i64 %t417, i64 %t418, i64 %t419, i64 %t420, i64 %t421, i64 %t422, i64 %t423, i64 %t424, i64 %t425, i64 1)
  store i64 %t426, ptr %local.rb_1.225
  %t427 = load i64, ptr %local.rb_1.225
  %t428 = load i64, ptr %local.gc_0.216
  %t429 = load i64, ptr %local.gc_1.217
  %t430 = load i64, ptr %local.gc_2.218
  %t431 = load i64, ptr %local.gc_3.219
  %t432 = load i64, ptr %local.gb_0.212
  %t433 = load i64, ptr %local.gb_1.213
  %t434 = load i64, ptr %local.gb_2.214
  %t435 = load i64, ptr %local.gb_3.215
  %t436 = load i64, ptr %local.alpha_bc
  %t437 = call i64 @"project_dim"(i64 %t427, i64 %t428, i64 %t429, i64 %t430, i64 %t431, i64 %t432, i64 %t433, i64 %t434, i64 %t435, i64 %t436, i64 1)
  store i64 %t437, ptr %local.rb_1.225
  %t438 = load i64, ptr %local.gb_2.214
  %t439 = load i64, ptr %local.ga_0.208
  %t440 = load i64, ptr %local.ga_1.209
  %t441 = load i64, ptr %local.ga_2.210
  %t442 = load i64, ptr %local.ga_3.211
  %t443 = load i64, ptr %local.gb_0.212
  %t444 = load i64, ptr %local.gb_1.213
  %t445 = load i64, ptr %local.gb_2.214
  %t446 = load i64, ptr %local.gb_3.215
  %t447 = load i64, ptr %local.alpha_ba
  %t448 = call i64 @"project_dim"(i64 %t438, i64 %t439, i64 %t440, i64 %t441, i64 %t442, i64 %t443, i64 %t444, i64 %t445, i64 %t446, i64 %t447, i64 2)
  store i64 %t448, ptr %local.rb_2.226
  %t449 = load i64, ptr %local.rb_2.226
  %t450 = load i64, ptr %local.gc_0.216
  %t451 = load i64, ptr %local.gc_1.217
  %t452 = load i64, ptr %local.gc_2.218
  %t453 = load i64, ptr %local.gc_3.219
  %t454 = load i64, ptr %local.gb_0.212
  %t455 = load i64, ptr %local.gb_1.213
  %t456 = load i64, ptr %local.gb_2.214
  %t457 = load i64, ptr %local.gb_3.215
  %t458 = load i64, ptr %local.alpha_bc
  %t459 = call i64 @"project_dim"(i64 %t449, i64 %t450, i64 %t451, i64 %t452, i64 %t453, i64 %t454, i64 %t455, i64 %t456, i64 %t457, i64 %t458, i64 2)
  store i64 %t459, ptr %local.rb_2.226
  %t460 = load i64, ptr %local.gb_3.215
  %t461 = load i64, ptr %local.ga_0.208
  %t462 = load i64, ptr %local.ga_1.209
  %t463 = load i64, ptr %local.ga_2.210
  %t464 = load i64, ptr %local.ga_3.211
  %t465 = load i64, ptr %local.gb_0.212
  %t466 = load i64, ptr %local.gb_1.213
  %t467 = load i64, ptr %local.gb_2.214
  %t468 = load i64, ptr %local.gb_3.215
  %t469 = load i64, ptr %local.alpha_ba
  %t470 = call i64 @"project_dim"(i64 %t460, i64 %t461, i64 %t462, i64 %t463, i64 %t464, i64 %t465, i64 %t466, i64 %t467, i64 %t468, i64 %t469, i64 3)
  store i64 %t470, ptr %local.rb_3.227
  %t471 = load i64, ptr %local.rb_3.227
  %t472 = load i64, ptr %local.gc_0.216
  %t473 = load i64, ptr %local.gc_1.217
  %t474 = load i64, ptr %local.gc_2.218
  %t475 = load i64, ptr %local.gc_3.219
  %t476 = load i64, ptr %local.gb_0.212
  %t477 = load i64, ptr %local.gb_1.213
  %t478 = load i64, ptr %local.gb_2.214
  %t479 = load i64, ptr %local.gb_3.215
  %t480 = load i64, ptr %local.alpha_bc
  %t481 = call i64 @"project_dim"(i64 %t471, i64 %t472, i64 %t473, i64 %t474, i64 %t475, i64 %t476, i64 %t477, i64 %t478, i64 %t479, i64 %t480, i64 3)
  store i64 %t481, ptr %local.rb_3.227
  %t482 = load i64, ptr %local.gc_0.216
  %t483 = load i64, ptr %local.ga_0.208
  %t484 = load i64, ptr %local.ga_1.209
  %t485 = load i64, ptr %local.ga_2.210
  %t486 = load i64, ptr %local.ga_3.211
  %t487 = load i64, ptr %local.gc_0.216
  %t488 = load i64, ptr %local.gc_1.217
  %t489 = load i64, ptr %local.gc_2.218
  %t490 = load i64, ptr %local.gc_3.219
  %t491 = load i64, ptr %local.alpha_ca
  %t492 = call i64 @"project_dim"(i64 %t482, i64 %t483, i64 %t484, i64 %t485, i64 %t486, i64 %t487, i64 %t488, i64 %t489, i64 %t490, i64 %t491, i64 0)
  store i64 %t492, ptr %local.rc_0.228
  %t493 = load i64, ptr %local.rc_0.228
  %t494 = load i64, ptr %local.gb_0.212
  %t495 = load i64, ptr %local.gb_1.213
  %t496 = load i64, ptr %local.gb_2.214
  %t497 = load i64, ptr %local.gb_3.215
  %t498 = load i64, ptr %local.gc_0.216
  %t499 = load i64, ptr %local.gc_1.217
  %t500 = load i64, ptr %local.gc_2.218
  %t501 = load i64, ptr %local.gc_3.219
  %t502 = load i64, ptr %local.alpha_cb
  %t503 = call i64 @"project_dim"(i64 %t493, i64 %t494, i64 %t495, i64 %t496, i64 %t497, i64 %t498, i64 %t499, i64 %t500, i64 %t501, i64 %t502, i64 0)
  store i64 %t503, ptr %local.rc_0.228
  %t504 = load i64, ptr %local.gc_1.217
  %t505 = load i64, ptr %local.ga_0.208
  %t506 = load i64, ptr %local.ga_1.209
  %t507 = load i64, ptr %local.ga_2.210
  %t508 = load i64, ptr %local.ga_3.211
  %t509 = load i64, ptr %local.gc_0.216
  %t510 = load i64, ptr %local.gc_1.217
  %t511 = load i64, ptr %local.gc_2.218
  %t512 = load i64, ptr %local.gc_3.219
  %t513 = load i64, ptr %local.alpha_ca
  %t514 = call i64 @"project_dim"(i64 %t504, i64 %t505, i64 %t506, i64 %t507, i64 %t508, i64 %t509, i64 %t510, i64 %t511, i64 %t512, i64 %t513, i64 1)
  store i64 %t514, ptr %local.rc_1.229
  %t515 = load i64, ptr %local.rc_1.229
  %t516 = load i64, ptr %local.gb_0.212
  %t517 = load i64, ptr %local.gb_1.213
  %t518 = load i64, ptr %local.gb_2.214
  %t519 = load i64, ptr %local.gb_3.215
  %t520 = load i64, ptr %local.gc_0.216
  %t521 = load i64, ptr %local.gc_1.217
  %t522 = load i64, ptr %local.gc_2.218
  %t523 = load i64, ptr %local.gc_3.219
  %t524 = load i64, ptr %local.alpha_cb
  %t525 = call i64 @"project_dim"(i64 %t515, i64 %t516, i64 %t517, i64 %t518, i64 %t519, i64 %t520, i64 %t521, i64 %t522, i64 %t523, i64 %t524, i64 1)
  store i64 %t525, ptr %local.rc_1.229
  %t526 = load i64, ptr %local.gc_2.218
  %t527 = load i64, ptr %local.ga_0.208
  %t528 = load i64, ptr %local.ga_1.209
  %t529 = load i64, ptr %local.ga_2.210
  %t530 = load i64, ptr %local.ga_3.211
  %t531 = load i64, ptr %local.gc_0.216
  %t532 = load i64, ptr %local.gc_1.217
  %t533 = load i64, ptr %local.gc_2.218
  %t534 = load i64, ptr %local.gc_3.219
  %t535 = load i64, ptr %local.alpha_ca
  %t536 = call i64 @"project_dim"(i64 %t526, i64 %t527, i64 %t528, i64 %t529, i64 %t530, i64 %t531, i64 %t532, i64 %t533, i64 %t534, i64 %t535, i64 2)
  store i64 %t536, ptr %local.rc_2.230
  %t537 = load i64, ptr %local.rc_2.230
  %t538 = load i64, ptr %local.gb_0.212
  %t539 = load i64, ptr %local.gb_1.213
  %t540 = load i64, ptr %local.gb_2.214
  %t541 = load i64, ptr %local.gb_3.215
  %t542 = load i64, ptr %local.gc_0.216
  %t543 = load i64, ptr %local.gc_1.217
  %t544 = load i64, ptr %local.gc_2.218
  %t545 = load i64, ptr %local.gc_3.219
  %t546 = load i64, ptr %local.alpha_cb
  %t547 = call i64 @"project_dim"(i64 %t537, i64 %t538, i64 %t539, i64 %t540, i64 %t541, i64 %t542, i64 %t543, i64 %t544, i64 %t545, i64 %t546, i64 2)
  store i64 %t547, ptr %local.rc_2.230
  %t548 = load i64, ptr %local.gc_3.219
  %t549 = load i64, ptr %local.ga_0.208
  %t550 = load i64, ptr %local.ga_1.209
  %t551 = load i64, ptr %local.ga_2.210
  %t552 = load i64, ptr %local.ga_3.211
  %t553 = load i64, ptr %local.gc_0.216
  %t554 = load i64, ptr %local.gc_1.217
  %t555 = load i64, ptr %local.gc_2.218
  %t556 = load i64, ptr %local.gc_3.219
  %t557 = load i64, ptr %local.alpha_ca
  %t558 = call i64 @"project_dim"(i64 %t548, i64 %t549, i64 %t550, i64 %t551, i64 %t552, i64 %t553, i64 %t554, i64 %t555, i64 %t556, i64 %t557, i64 3)
  store i64 %t558, ptr %local.rc_3.231
  %t559 = load i64, ptr %local.rc_3.231
  %t560 = load i64, ptr %local.gb_0.212
  %t561 = load i64, ptr %local.gb_1.213
  %t562 = load i64, ptr %local.gb_2.214
  %t563 = load i64, ptr %local.gb_3.215
  %t564 = load i64, ptr %local.gc_0.216
  %t565 = load i64, ptr %local.gc_1.217
  %t566 = load i64, ptr %local.gc_2.218
  %t567 = load i64, ptr %local.gc_3.219
  %t568 = load i64, ptr %local.alpha_cb
  %t569 = call i64 @"project_dim"(i64 %t559, i64 %t560, i64 %t561, i64 %t562, i64 %t563, i64 %t564, i64 %t565, i64 %t566, i64 %t567, i64 %t568, i64 3)
  store i64 %t569, ptr %local.rc_3.231
  %t570 = load i64, ptr %local.w0.203
  %t571 = load i64, ptr %local.lr.232
  %t572 = load i64, ptr %local.ra_0.220
  %t573 = load i64, ptr %local.rb_0.224
  %t574 = call i64 @"sx_f64_add"(i64 %t572, i64 %t573)
  %t575 = load i64, ptr %local.rc_0.228
  %t576 = call i64 @"sx_f64_add"(i64 %t574, i64 %t575)
  %t577 = call i64 @"sx_f64_mul"(i64 %t571, i64 %t576)
  %t578 = call i64 @"sx_f64_sub"(i64 %t570, i64 %t577)
  store i64 %t578, ptr %local.w0.203
  %t579 = load i64, ptr %local.w1.204
  %t580 = load i64, ptr %local.lr.232
  %t581 = load i64, ptr %local.ra_1.221
  %t582 = load i64, ptr %local.rb_1.225
  %t583 = call i64 @"sx_f64_add"(i64 %t581, i64 %t582)
  %t584 = load i64, ptr %local.rc_1.229
  %t585 = call i64 @"sx_f64_add"(i64 %t583, i64 %t584)
  %t586 = call i64 @"sx_f64_mul"(i64 %t580, i64 %t585)
  %t587 = call i64 @"sx_f64_sub"(i64 %t579, i64 %t586)
  store i64 %t587, ptr %local.w1.204
  %t588 = load i64, ptr %local.w2.205
  %t589 = load i64, ptr %local.lr.232
  %t590 = load i64, ptr %local.ra_2.222
  %t591 = load i64, ptr %local.rb_2.226
  %t592 = call i64 @"sx_f64_add"(i64 %t590, i64 %t591)
  %t593 = load i64, ptr %local.rc_2.230
  %t594 = call i64 @"sx_f64_add"(i64 %t592, i64 %t593)
  %t595 = call i64 @"sx_f64_mul"(i64 %t589, i64 %t594)
  %t596 = call i64 @"sx_f64_sub"(i64 %t588, i64 %t595)
  store i64 %t596, ptr %local.w2.205
  %t597 = load i64, ptr %local.w3.206
  %t598 = load i64, ptr %local.lr.232
  %t599 = load i64, ptr %local.ra_3.223
  %t600 = load i64, ptr %local.rb_3.227
  %t601 = call i64 @"sx_f64_add"(i64 %t599, i64 %t600)
  %t602 = load i64, ptr %local.rc_3.231
  %t603 = call i64 @"sx_f64_add"(i64 %t601, i64 %t602)
  %t604 = call i64 @"sx_f64_mul"(i64 %t598, i64 %t603)
  %t605 = call i64 @"sx_f64_sub"(i64 %t597, i64 %t604)
  store i64 %t605, ptr %local.w3.206
  %t606 = load i64, ptr %local.step.207
  %t607 = add i64 %t606, 1
  store i64 %t607, ptr %local.step.207
  br label %loop7
endloop7:
  %t608 = load i64, ptr %local.w0.203
  %t609 = load i64, ptr %local.w1.204
  %t610 = load i64, ptr %local.w2.205
  %t611 = load i64, ptr %local.w3.206
  %t612 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.48)
  %t613 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.49)
  %t614 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.50)
  %t615 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.51)
  %t616 = call i64 @"loss4"(i64 %t608, i64 %t609, i64 %t610, i64 %t611, i64 %t612, i64 %t613, i64 %t614, i64 %t615)
  store i64 %t616, ptr %local.la.233
  %t617 = load i64, ptr %local.w0.203
  %t618 = load i64, ptr %local.w1.204
  %t619 = load i64, ptr %local.w2.205
  %t620 = load i64, ptr %local.w3.206
  %t621 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.52)
  %t622 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.53)
  %t623 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.54)
  %t624 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.55)
  %t625 = call i64 @"loss4"(i64 %t617, i64 %t618, i64 %t619, i64 %t620, i64 %t621, i64 %t622, i64 %t623, i64 %t624)
  store i64 %t625, ptr %local.lb.234
  %t626 = load i64, ptr %local.w0.203
  %t627 = load i64, ptr %local.w1.204
  %t628 = load i64, ptr %local.w2.205
  %t629 = load i64, ptr %local.w3.206
  %t630 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.56)
  %t631 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.57)
  %t632 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.58)
  %t633 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.59)
  %t634 = call i64 @"loss4"(i64 %t626, i64 %t627, i64 %t628, i64 %t629, i64 %t630, i64 %t631, i64 %t632, i64 %t633)
  store i64 %t634, ptr %local.lc.235
  %t635 = load i64, ptr %local.la.233
  %t636 = load i64, ptr %local.lb.234
  %t637 = call i64 @"sx_f64_add"(i64 %t635, i64 %t636)
  %t638 = load i64, ptr %local.lc.235
  %t639 = call i64 @"sx_f64_add"(i64 %t637, i64 %t638)
  ret i64 %t639
}

define i64 @"exp1_meta_grad"(i64 %base_ab, i64 %base_ac, i64 %base_ba, i64 %base_bc, i64 %base_ca, i64 %base_cb, i64 %which, i64 %steps) nounwind {
entry:
  %local.h.640 = alloca i64
  %local.ab_p.641 = alloca i64
  %local.ac_p.642 = alloca i64
  %local.ba_p.643 = alloca i64
  %local.bc_p.644 = alloca i64
  %local.ca_p.645 = alloca i64
  %local.cb_p.646 = alloca i64
  %local.ab_m.647 = alloca i64
  %local.ac_m.648 = alloca i64
  %local.ba_m.649 = alloca i64
  %local.bc_m.650 = alloca i64
  %local.ca_m.651 = alloca i64
  %local.cb_m.652 = alloca i64
  %local.lp.653 = alloca i64
  %local.lm.654 = alloca i64
  %local.base_ab = alloca i64
  store i64 %base_ab, ptr %local.base_ab
  %local.base_ac = alloca i64
  store i64 %base_ac, ptr %local.base_ac
  %local.base_ba = alloca i64
  store i64 %base_ba, ptr %local.base_ba
  %local.base_bc = alloca i64
  store i64 %base_bc, ptr %local.base_bc
  %local.base_ca = alloca i64
  store i64 %base_ca, ptr %local.base_ca
  %local.base_cb = alloca i64
  store i64 %base_cb, ptr %local.base_cb
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t655 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.60)
  store i64 %t655, ptr %local.h.640
  %t656 = load i64, ptr %local.base_ab
  store i64 %t656, ptr %local.ab_p.641
  %t657 = load i64, ptr %local.base_ac
  store i64 %t657, ptr %local.ac_p.642
  %t658 = load i64, ptr %local.base_ba
  store i64 %t658, ptr %local.ba_p.643
  %t659 = load i64, ptr %local.base_bc
  store i64 %t659, ptr %local.bc_p.644
  %t660 = load i64, ptr %local.base_ca
  store i64 %t660, ptr %local.ca_p.645
  %t661 = load i64, ptr %local.base_cb
  store i64 %t661, ptr %local.cb_p.646
  %t662 = load i64, ptr %local.base_ab
  store i64 %t662, ptr %local.ab_m.647
  %t663 = load i64, ptr %local.base_ac
  store i64 %t663, ptr %local.ac_m.648
  %t664 = load i64, ptr %local.base_ba
  store i64 %t664, ptr %local.ba_m.649
  %t665 = load i64, ptr %local.base_bc
  store i64 %t665, ptr %local.bc_m.650
  %t666 = load i64, ptr %local.base_ca
  store i64 %t666, ptr %local.ca_m.651
  %t667 = load i64, ptr %local.base_cb
  store i64 %t667, ptr %local.cb_m.652
  %t668 = load i64, ptr %local.which
  %t669 = icmp eq i64 %t668, 0
  %t670 = zext i1 %t669 to i64
  %t671 = icmp ne i64 %t670, 0
  br i1 %t671, label %then8, label %else8
then8:
  %t672 = load i64, ptr %local.base_ab
  %t673 = load i64, ptr %local.h.640
  %t674 = call i64 @"sx_f64_add"(i64 %t672, i64 %t673)
  store i64 %t674, ptr %local.ab_p.641
  %t675 = load i64, ptr %local.base_ab
  %t676 = load i64, ptr %local.h.640
  %t677 = call i64 @"sx_f64_sub"(i64 %t675, i64 %t676)
  store i64 %t677, ptr %local.ab_m.647
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t678 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t679 = load i64, ptr %local.which
  %t680 = icmp eq i64 %t679, 1
  %t681 = zext i1 %t680 to i64
  %t682 = icmp ne i64 %t681, 0
  br i1 %t682, label %then9, label %else9
then9:
  %t683 = load i64, ptr %local.base_ac
  %t684 = load i64, ptr %local.h.640
  %t685 = call i64 @"sx_f64_add"(i64 %t683, i64 %t684)
  store i64 %t685, ptr %local.ac_p.642
  %t686 = load i64, ptr %local.base_ac
  %t687 = load i64, ptr %local.h.640
  %t688 = call i64 @"sx_f64_sub"(i64 %t686, i64 %t687)
  store i64 %t688, ptr %local.ac_m.648
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t689 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t690 = load i64, ptr %local.which
  %t691 = icmp eq i64 %t690, 2
  %t692 = zext i1 %t691 to i64
  %t693 = icmp ne i64 %t692, 0
  br i1 %t693, label %then10, label %else10
then10:
  %t694 = load i64, ptr %local.base_ba
  %t695 = load i64, ptr %local.h.640
  %t696 = call i64 @"sx_f64_add"(i64 %t694, i64 %t695)
  store i64 %t696, ptr %local.ba_p.643
  %t697 = load i64, ptr %local.base_ba
  %t698 = load i64, ptr %local.h.640
  %t699 = call i64 @"sx_f64_sub"(i64 %t697, i64 %t698)
  store i64 %t699, ptr %local.ba_m.649
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t700 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t701 = load i64, ptr %local.which
  %t702 = icmp eq i64 %t701, 3
  %t703 = zext i1 %t702 to i64
  %t704 = icmp ne i64 %t703, 0
  br i1 %t704, label %then11, label %else11
then11:
  %t705 = load i64, ptr %local.base_bc
  %t706 = load i64, ptr %local.h.640
  %t707 = call i64 @"sx_f64_add"(i64 %t705, i64 %t706)
  store i64 %t707, ptr %local.bc_p.644
  %t708 = load i64, ptr %local.base_bc
  %t709 = load i64, ptr %local.h.640
  %t710 = call i64 @"sx_f64_sub"(i64 %t708, i64 %t709)
  store i64 %t710, ptr %local.bc_m.650
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t711 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t712 = load i64, ptr %local.which
  %t713 = icmp eq i64 %t712, 4
  %t714 = zext i1 %t713 to i64
  %t715 = icmp ne i64 %t714, 0
  br i1 %t715, label %then12, label %else12
then12:
  %t716 = load i64, ptr %local.base_ca
  %t717 = load i64, ptr %local.h.640
  %t718 = call i64 @"sx_f64_add"(i64 %t716, i64 %t717)
  store i64 %t718, ptr %local.ca_p.645
  %t719 = load i64, ptr %local.base_ca
  %t720 = load i64, ptr %local.h.640
  %t721 = call i64 @"sx_f64_sub"(i64 %t719, i64 %t720)
  store i64 %t721, ptr %local.ca_m.651
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t722 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t723 = load i64, ptr %local.which
  %t724 = icmp eq i64 %t723, 5
  %t725 = zext i1 %t724 to i64
  %t726 = icmp ne i64 %t725, 0
  br i1 %t726, label %then13, label %else13
then13:
  %t727 = load i64, ptr %local.base_cb
  %t728 = load i64, ptr %local.h.640
  %t729 = call i64 @"sx_f64_add"(i64 %t727, i64 %t728)
  store i64 %t729, ptr %local.cb_p.646
  %t730 = load i64, ptr %local.base_cb
  %t731 = load i64, ptr %local.h.640
  %t732 = call i64 @"sx_f64_sub"(i64 %t730, i64 %t731)
  store i64 %t732, ptr %local.cb_m.652
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t733 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t734 = load i64, ptr %local.ab_p.641
  %t735 = load i64, ptr %local.ac_p.642
  %t736 = load i64, ptr %local.ba_p.643
  %t737 = load i64, ptr %local.bc_p.644
  %t738 = load i64, ptr %local.ca_p.645
  %t739 = load i64, ptr %local.cb_p.646
  %t740 = load i64, ptr %local.steps
  %t741 = call i64 @"exp1_run_cycle"(i64 %t734, i64 %t735, i64 %t736, i64 %t737, i64 %t738, i64 %t739, i64 %t740)
  store i64 %t741, ptr %local.lp.653
  %t742 = load i64, ptr %local.ab_m.647
  %t743 = load i64, ptr %local.ac_m.648
  %t744 = load i64, ptr %local.ba_m.649
  %t745 = load i64, ptr %local.bc_m.650
  %t746 = load i64, ptr %local.ca_m.651
  %t747 = load i64, ptr %local.cb_m.652
  %t748 = load i64, ptr %local.steps
  %t749 = call i64 @"exp1_run_cycle"(i64 %t742, i64 %t743, i64 %t744, i64 %t745, i64 %t746, i64 %t747, i64 %t748)
  store i64 %t749, ptr %local.lm.654
  %t750 = load i64, ptr %local.lp.653
  %t751 = load i64, ptr %local.lm.654
  %t752 = call i64 @"sx_f64_sub"(i64 %t750, i64 %t751)
  %t753 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.61)
  %t754 = load i64, ptr %local.h.640
  %t755 = call i64 @"sx_f64_mul"(i64 %t753, i64 %t754)
  %t756 = call i64 @"sx_f64_div"(i64 %t752, i64 %t755)
  ret i64 %t756
}

define i64 @"run_exp1"() nounwind {
entry:
  %local.alpha_ab.757 = alloca i64
  %local.alpha_ac.758 = alloca i64
  %local.alpha_ba.759 = alloca i64
  %local.alpha_bc.760 = alloca i64
  %local.alpha_ca.761 = alloca i64
  %local.alpha_cb.762 = alloca i64
  %local.prev_ab.763 = alloca i64
  %local.prev_ac.764 = alloca i64
  %local.prev_ba.765 = alloca i64
  %local.prev_bc.766 = alloca i64
  %local.prev_ca.767 = alloca i64
  %local.prev_cb.768 = alloca i64
  %local.cycle.769 = alloca i64
  %local.mg.770 = alloca i64
  %local.loss.771 = alloca i64
  %local.drift.772 = alloca i64
  %local.max_alpha.773 = alloca i64
  %local.min_alpha.774 = alloca i64
  %local.asym.775 = alloca i64
  %local.meta_lr.776 = alloca i64
  %local.inner_steps.777 = alloca i64
  %local.meta_cycles.778 = alloca i64
  %t779 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.62)
  store i64 %t779, ptr %local.alpha_ab.757
  %t780 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.63)
  store i64 %t780, ptr %local.alpha_ac.758
  %t781 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.64)
  store i64 %t781, ptr %local.alpha_ba.759
  %t782 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.65)
  store i64 %t782, ptr %local.alpha_bc.760
  %t783 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.66)
  store i64 %t783, ptr %local.alpha_ca.761
  %t784 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.67)
  store i64 %t784, ptr %local.alpha_cb.762
  %t785 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.68)
  store i64 %t785, ptr %local.prev_ab.763
  %t786 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.69)
  store i64 %t786, ptr %local.prev_ac.764
  %t787 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.70)
  store i64 %t787, ptr %local.prev_ba.765
  %t788 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.71)
  store i64 %t788, ptr %local.prev_bc.766
  %t789 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.72)
  store i64 %t789, ptr %local.prev_ca.767
  %t790 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.73)
  store i64 %t790, ptr %local.prev_cb.768
  store i64 0, ptr %local.cycle.769
  %t791 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.74)
  store i64 %t791, ptr %local.mg.770
  %t792 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.75)
  store i64 %t792, ptr %local.loss.771
  %t793 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.76)
  store i64 %t793, ptr %local.drift.772
  %t794 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.77)
  store i64 %t794, ptr %local.max_alpha.773
  %t795 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.78)
  store i64 %t795, ptr %local.min_alpha.774
  %t796 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.79)
  store i64 %t796, ptr %local.asym.775
  %t797 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.80)
  store i64 %t797, ptr %local.meta_lr.776
  store i64 200, ptr %local.inner_steps.777
  store i64 60, ptr %local.meta_cycles.778
  %t798 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.81)
  %t799 = ptrtoint ptr %t798 to i64
  %t800 = inttoptr i64 %t799 to ptr
  call void @intrinsic_println(ptr %t800)
  %t801 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.82)
  %t802 = ptrtoint ptr %t801 to i64
  %t803 = inttoptr i64 %t802 to ptr
  call void @intrinsic_println(ptr %t803)
  %t804 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.83)
  %t805 = ptrtoint ptr %t804 to i64
  %t806 = inttoptr i64 %t805 to ptr
  call void @intrinsic_println(ptr %t806)
  %t807 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.84)
  %t808 = ptrtoint ptr %t807 to i64
  %t809 = inttoptr i64 %t808 to ptr
  call void @intrinsic_println(ptr %t809)
  %t810 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.85)
  %t811 = ptrtoint ptr %t810 to i64
  %t812 = inttoptr i64 %t811 to ptr
  call void @intrinsic_println(ptr %t812)
  %t813 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.86)
  %t814 = ptrtoint ptr %t813 to i64
  %t815 = inttoptr i64 %t814 to ptr
  call void @intrinsic_println(ptr %t815)
  %t816 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.87)
  %t817 = ptrtoint ptr %t816 to i64
  %t818 = inttoptr i64 %t817 to ptr
  call void @intrinsic_println(ptr %t818)
  %t819 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.88)
  %t820 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.89)
  %t821 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.90)
  %t822 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.91)
  %t823 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.92)
  %t824 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.93)
  %t825 = load i64, ptr %local.inner_steps.777
  %t826 = call i64 @"exp1_run_cycle"(i64 %t819, i64 %t820, i64 %t821, i64 %t822, i64 %t823, i64 %t824, i64 %t825)
  store i64 %t826, ptr %local.loss.771
  %t827 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.94)
  %t828 = ptrtoint ptr %t827 to i64
  %t829 = inttoptr i64 %t828 to ptr
  call void @intrinsic_print(ptr %t829)
  %t830 = load i64, ptr %local.loss.771
  %t831 = call i64 @"print_f64"(i64 %t830)
  %t832 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.95)
  %t833 = ptrtoint ptr %t832 to i64
  %t834 = inttoptr i64 %t833 to ptr
  call void @intrinsic_println(ptr %t834)
  %t835 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.96)
  %t836 = ptrtoint ptr %t835 to i64
  %t837 = inttoptr i64 %t836 to ptr
  call void @intrinsic_println(ptr %t837)
  %t838 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.97)
  %t839 = ptrtoint ptr %t838 to i64
  %t840 = inttoptr i64 %t839 to ptr
  call void @intrinsic_println(ptr %t840)
  %t841 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.98)
  %t842 = ptrtoint ptr %t841 to i64
  %t843 = inttoptr i64 %t842 to ptr
  call void @intrinsic_println(ptr %t843)
  br label %loop14
loop14:
  %t844 = load i64, ptr %local.cycle.769
  %t845 = load i64, ptr %local.meta_cycles.778
  %t846 = icmp slt i64 %t844, %t845
  %t847 = zext i1 %t846 to i64
  %t848 = icmp ne i64 %t847, 0
  br i1 %t848, label %body14, label %endloop14
body14:
  %t849 = load i64, ptr %local.alpha_ab.757
  store i64 %t849, ptr %local.prev_ab.763
  %t850 = load i64, ptr %local.alpha_ac.758
  store i64 %t850, ptr %local.prev_ac.764
  %t851 = load i64, ptr %local.alpha_ba.759
  store i64 %t851, ptr %local.prev_ba.765
  %t852 = load i64, ptr %local.alpha_bc.760
  store i64 %t852, ptr %local.prev_bc.766
  %t853 = load i64, ptr %local.alpha_ca.761
  store i64 %t853, ptr %local.prev_ca.767
  %t854 = load i64, ptr %local.alpha_cb.762
  store i64 %t854, ptr %local.prev_cb.768
  %t855 = load i64, ptr %local.alpha_ab.757
  %t856 = load i64, ptr %local.alpha_ac.758
  %t857 = load i64, ptr %local.alpha_ba.759
  %t858 = load i64, ptr %local.alpha_bc.760
  %t859 = load i64, ptr %local.alpha_ca.761
  %t860 = load i64, ptr %local.alpha_cb.762
  %t861 = load i64, ptr %local.inner_steps.777
  %t862 = call i64 @"exp1_meta_grad"(i64 %t855, i64 %t856, i64 %t857, i64 %t858, i64 %t859, i64 %t860, i64 0, i64 %t861)
  store i64 %t862, ptr %local.mg.770
  %t863 = load i64, ptr %local.alpha_ab.757
  %t864 = load i64, ptr %local.meta_lr.776
  %t865 = load i64, ptr %local.mg.770
  %t866 = call i64 @"sx_f64_mul"(i64 %t864, i64 %t865)
  %t867 = call i64 @"sx_f64_sub"(i64 %t863, i64 %t866)
  %t868 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.99)
  %t869 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.100)
  %t870 = call i64 @"clamp"(i64 %t867, i64 %t868, i64 %t869)
  store i64 %t870, ptr %local.alpha_ab.757
  %t871 = load i64, ptr %local.alpha_ab.757
  %t872 = load i64, ptr %local.alpha_ac.758
  %t873 = load i64, ptr %local.alpha_ba.759
  %t874 = load i64, ptr %local.alpha_bc.760
  %t875 = load i64, ptr %local.alpha_ca.761
  %t876 = load i64, ptr %local.alpha_cb.762
  %t877 = load i64, ptr %local.inner_steps.777
  %t878 = call i64 @"exp1_meta_grad"(i64 %t871, i64 %t872, i64 %t873, i64 %t874, i64 %t875, i64 %t876, i64 1, i64 %t877)
  store i64 %t878, ptr %local.mg.770
  %t879 = load i64, ptr %local.alpha_ac.758
  %t880 = load i64, ptr %local.meta_lr.776
  %t881 = load i64, ptr %local.mg.770
  %t882 = call i64 @"sx_f64_mul"(i64 %t880, i64 %t881)
  %t883 = call i64 @"sx_f64_sub"(i64 %t879, i64 %t882)
  %t884 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.101)
  %t885 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.102)
  %t886 = call i64 @"clamp"(i64 %t883, i64 %t884, i64 %t885)
  store i64 %t886, ptr %local.alpha_ac.758
  %t887 = load i64, ptr %local.alpha_ab.757
  %t888 = load i64, ptr %local.alpha_ac.758
  %t889 = load i64, ptr %local.alpha_ba.759
  %t890 = load i64, ptr %local.alpha_bc.760
  %t891 = load i64, ptr %local.alpha_ca.761
  %t892 = load i64, ptr %local.alpha_cb.762
  %t893 = load i64, ptr %local.inner_steps.777
  %t894 = call i64 @"exp1_meta_grad"(i64 %t887, i64 %t888, i64 %t889, i64 %t890, i64 %t891, i64 %t892, i64 2, i64 %t893)
  store i64 %t894, ptr %local.mg.770
  %t895 = load i64, ptr %local.alpha_ba.759
  %t896 = load i64, ptr %local.meta_lr.776
  %t897 = load i64, ptr %local.mg.770
  %t898 = call i64 @"sx_f64_mul"(i64 %t896, i64 %t897)
  %t899 = call i64 @"sx_f64_sub"(i64 %t895, i64 %t898)
  %t900 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.103)
  %t901 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.104)
  %t902 = call i64 @"clamp"(i64 %t899, i64 %t900, i64 %t901)
  store i64 %t902, ptr %local.alpha_ba.759
  %t903 = load i64, ptr %local.alpha_ab.757
  %t904 = load i64, ptr %local.alpha_ac.758
  %t905 = load i64, ptr %local.alpha_ba.759
  %t906 = load i64, ptr %local.alpha_bc.760
  %t907 = load i64, ptr %local.alpha_ca.761
  %t908 = load i64, ptr %local.alpha_cb.762
  %t909 = load i64, ptr %local.inner_steps.777
  %t910 = call i64 @"exp1_meta_grad"(i64 %t903, i64 %t904, i64 %t905, i64 %t906, i64 %t907, i64 %t908, i64 3, i64 %t909)
  store i64 %t910, ptr %local.mg.770
  %t911 = load i64, ptr %local.alpha_bc.760
  %t912 = load i64, ptr %local.meta_lr.776
  %t913 = load i64, ptr %local.mg.770
  %t914 = call i64 @"sx_f64_mul"(i64 %t912, i64 %t913)
  %t915 = call i64 @"sx_f64_sub"(i64 %t911, i64 %t914)
  %t916 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.105)
  %t917 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.106)
  %t918 = call i64 @"clamp"(i64 %t915, i64 %t916, i64 %t917)
  store i64 %t918, ptr %local.alpha_bc.760
  %t919 = load i64, ptr %local.alpha_ab.757
  %t920 = load i64, ptr %local.alpha_ac.758
  %t921 = load i64, ptr %local.alpha_ba.759
  %t922 = load i64, ptr %local.alpha_bc.760
  %t923 = load i64, ptr %local.alpha_ca.761
  %t924 = load i64, ptr %local.alpha_cb.762
  %t925 = load i64, ptr %local.inner_steps.777
  %t926 = call i64 @"exp1_meta_grad"(i64 %t919, i64 %t920, i64 %t921, i64 %t922, i64 %t923, i64 %t924, i64 4, i64 %t925)
  store i64 %t926, ptr %local.mg.770
  %t927 = load i64, ptr %local.alpha_ca.761
  %t928 = load i64, ptr %local.meta_lr.776
  %t929 = load i64, ptr %local.mg.770
  %t930 = call i64 @"sx_f64_mul"(i64 %t928, i64 %t929)
  %t931 = call i64 @"sx_f64_sub"(i64 %t927, i64 %t930)
  %t932 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.107)
  %t933 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.108)
  %t934 = call i64 @"clamp"(i64 %t931, i64 %t932, i64 %t933)
  store i64 %t934, ptr %local.alpha_ca.761
  %t935 = load i64, ptr %local.alpha_ab.757
  %t936 = load i64, ptr %local.alpha_ac.758
  %t937 = load i64, ptr %local.alpha_ba.759
  %t938 = load i64, ptr %local.alpha_bc.760
  %t939 = load i64, ptr %local.alpha_ca.761
  %t940 = load i64, ptr %local.alpha_cb.762
  %t941 = load i64, ptr %local.inner_steps.777
  %t942 = call i64 @"exp1_meta_grad"(i64 %t935, i64 %t936, i64 %t937, i64 %t938, i64 %t939, i64 %t940, i64 5, i64 %t941)
  store i64 %t942, ptr %local.mg.770
  %t943 = load i64, ptr %local.alpha_cb.762
  %t944 = load i64, ptr %local.meta_lr.776
  %t945 = load i64, ptr %local.mg.770
  %t946 = call i64 @"sx_f64_mul"(i64 %t944, i64 %t945)
  %t947 = call i64 @"sx_f64_sub"(i64 %t943, i64 %t946)
  %t948 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.109)
  %t949 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.110)
  %t950 = call i64 @"clamp"(i64 %t947, i64 %t948, i64 %t949)
  store i64 %t950, ptr %local.alpha_cb.762
  %t951 = load i64, ptr %local.alpha_ab.757
  %t952 = load i64, ptr %local.alpha_ac.758
  %t953 = load i64, ptr %local.alpha_ba.759
  %t954 = load i64, ptr %local.alpha_bc.760
  %t955 = load i64, ptr %local.alpha_ca.761
  %t956 = load i64, ptr %local.alpha_cb.762
  %t957 = load i64, ptr %local.inner_steps.777
  %t958 = call i64 @"exp1_run_cycle"(i64 %t951, i64 %t952, i64 %t953, i64 %t954, i64 %t955, i64 %t956, i64 %t957)
  store i64 %t958, ptr %local.loss.771
  %t959 = load i64, ptr %local.alpha_ab.757
  %t960 = load i64, ptr %local.prev_ab.763
  %t961 = call i64 @"sx_f64_sub"(i64 %t959, i64 %t960)
  %t962 = call i64 @"abs_f64"(i64 %t961)
  %t963 = load i64, ptr %local.alpha_ac.758
  %t964 = load i64, ptr %local.prev_ac.764
  %t965 = call i64 @"sx_f64_sub"(i64 %t963, i64 %t964)
  %t966 = call i64 @"abs_f64"(i64 %t965)
  %t967 = call i64 @"sx_f64_add"(i64 %t962, i64 %t966)
  %t968 = load i64, ptr %local.alpha_ba.759
  %t969 = load i64, ptr %local.prev_ba.765
  %t970 = call i64 @"sx_f64_sub"(i64 %t968, i64 %t969)
  %t971 = call i64 @"abs_f64"(i64 %t970)
  %t972 = call i64 @"sx_f64_add"(i64 %t967, i64 %t971)
  %t973 = load i64, ptr %local.alpha_bc.760
  %t974 = load i64, ptr %local.prev_bc.766
  %t975 = call i64 @"sx_f64_sub"(i64 %t973, i64 %t974)
  %t976 = call i64 @"abs_f64"(i64 %t975)
  %t977 = call i64 @"sx_f64_add"(i64 %t972, i64 %t976)
  %t978 = load i64, ptr %local.alpha_ca.761
  %t979 = load i64, ptr %local.prev_ca.767
  %t980 = call i64 @"sx_f64_sub"(i64 %t978, i64 %t979)
  %t981 = call i64 @"abs_f64"(i64 %t980)
  %t982 = call i64 @"sx_f64_add"(i64 %t977, i64 %t981)
  %t983 = load i64, ptr %local.alpha_cb.762
  %t984 = load i64, ptr %local.prev_cb.768
  %t985 = call i64 @"sx_f64_sub"(i64 %t983, i64 %t984)
  %t986 = call i64 @"abs_f64"(i64 %t985)
  %t987 = call i64 @"sx_f64_add"(i64 %t982, i64 %t986)
  store i64 %t987, ptr %local.drift.772
  %t988 = load i64, ptr %local.cycle.769
  %t989 = icmp slt i64 %t988, 5
  %t990 = zext i1 %t989 to i64
  %t991 = icmp ne i64 %t990, 0
  br i1 %t991, label %then15, label %else15
then15:
  %t992 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.111)
  %t993 = ptrtoint ptr %t992 to i64
  %t994 = inttoptr i64 %t993 to ptr
  call void @intrinsic_print(ptr %t994)
  %t995 = load i64, ptr %local.cycle.769
  call void @print_i64(i64 %t995)
  %t996 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.112)
  %t997 = ptrtoint ptr %t996 to i64
  %t998 = inttoptr i64 %t997 to ptr
  call void @intrinsic_print(ptr %t998)
  %t999 = load i64, ptr %local.loss.771
  %t1000 = call i64 @"print_f64"(i64 %t999)
  %t1001 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.113)
  %t1002 = ptrtoint ptr %t1001 to i64
  %t1003 = inttoptr i64 %t1002 to ptr
  call void @intrinsic_print(ptr %t1003)
  %t1004 = load i64, ptr %local.drift.772
  %t1005 = call i64 @"print_f64"(i64 %t1004)
  %t1006 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.114)
  %t1007 = ptrtoint ptr %t1006 to i64
  %t1008 = inttoptr i64 %t1007 to ptr
  call void @intrinsic_print(ptr %t1008)
  %t1009 = load i64, ptr %local.alpha_ab.757
  %t1010 = call i64 @"print_f64"(i64 %t1009)
  %t1011 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.115)
  %t1012 = ptrtoint ptr %t1011 to i64
  %t1013 = inttoptr i64 %t1012 to ptr
  call void @intrinsic_print(ptr %t1013)
  %t1014 = load i64, ptr %local.alpha_ac.758
  %t1015 = call i64 @"print_f64"(i64 %t1014)
  %t1016 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.116)
  %t1017 = ptrtoint ptr %t1016 to i64
  %t1018 = inttoptr i64 %t1017 to ptr
  call void @intrinsic_print(ptr %t1018)
  %t1019 = load i64, ptr %local.alpha_ba.759
  %t1020 = call i64 @"print_f64"(i64 %t1019)
  %t1021 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.117)
  %t1022 = ptrtoint ptr %t1021 to i64
  %t1023 = inttoptr i64 %t1022 to ptr
  call void @intrinsic_print(ptr %t1023)
  %t1024 = load i64, ptr %local.alpha_bc.760
  %t1025 = call i64 @"print_f64"(i64 %t1024)
  %t1026 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.118)
  %t1027 = ptrtoint ptr %t1026 to i64
  %t1028 = inttoptr i64 %t1027 to ptr
  call void @intrinsic_print(ptr %t1028)
  %t1029 = load i64, ptr %local.alpha_ca.761
  %t1030 = call i64 @"print_f64"(i64 %t1029)
  %t1031 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.119)
  %t1032 = ptrtoint ptr %t1031 to i64
  %t1033 = inttoptr i64 %t1032 to ptr
  call void @intrinsic_print(ptr %t1033)
  %t1034 = load i64, ptr %local.alpha_cb.762
  %t1035 = call i64 @"print_f64"(i64 %t1034)
  %t1036 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.120)
  %t1037 = ptrtoint ptr %t1036 to i64
  %t1038 = inttoptr i64 %t1037 to ptr
  call void @intrinsic_println(ptr %t1038)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t1039 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t1040 = load i64, ptr %local.cycle.769
  %t1041 = icmp eq i64 %t1040, 29
  %t1042 = zext i1 %t1041 to i64
  %t1043 = icmp ne i64 %t1042, 0
  br i1 %t1043, label %then16, label %else16
then16:
  %t1044 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.121)
  %t1045 = ptrtoint ptr %t1044 to i64
  %t1046 = inttoptr i64 %t1045 to ptr
  call void @intrinsic_print(ptr %t1046)
  %t1047 = load i64, ptr %local.loss.771
  %t1048 = call i64 @"print_f64"(i64 %t1047)
  %t1049 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.122)
  %t1050 = ptrtoint ptr %t1049 to i64
  %t1051 = inttoptr i64 %t1050 to ptr
  call void @intrinsic_print(ptr %t1051)
  %t1052 = load i64, ptr %local.drift.772
  %t1053 = call i64 @"print_f64"(i64 %t1052)
  %t1054 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.123)
  %t1055 = ptrtoint ptr %t1054 to i64
  %t1056 = inttoptr i64 %t1055 to ptr
  call void @intrinsic_print(ptr %t1056)
  %t1057 = load i64, ptr %local.alpha_ab.757
  %t1058 = call i64 @"print_f64"(i64 %t1057)
  %t1059 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.124)
  %t1060 = ptrtoint ptr %t1059 to i64
  %t1061 = inttoptr i64 %t1060 to ptr
  call void @intrinsic_print(ptr %t1061)
  %t1062 = load i64, ptr %local.alpha_ac.758
  %t1063 = call i64 @"print_f64"(i64 %t1062)
  %t1064 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.125)
  %t1065 = ptrtoint ptr %t1064 to i64
  %t1066 = inttoptr i64 %t1065 to ptr
  call void @intrinsic_print(ptr %t1066)
  %t1067 = load i64, ptr %local.alpha_ba.759
  %t1068 = call i64 @"print_f64"(i64 %t1067)
  %t1069 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.126)
  %t1070 = ptrtoint ptr %t1069 to i64
  %t1071 = inttoptr i64 %t1070 to ptr
  call void @intrinsic_print(ptr %t1071)
  %t1072 = load i64, ptr %local.alpha_bc.760
  %t1073 = call i64 @"print_f64"(i64 %t1072)
  %t1074 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.127)
  %t1075 = ptrtoint ptr %t1074 to i64
  %t1076 = inttoptr i64 %t1075 to ptr
  call void @intrinsic_print(ptr %t1076)
  %t1077 = load i64, ptr %local.alpha_ca.761
  %t1078 = call i64 @"print_f64"(i64 %t1077)
  %t1079 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.128)
  %t1080 = ptrtoint ptr %t1079 to i64
  %t1081 = inttoptr i64 %t1080 to ptr
  call void @intrinsic_print(ptr %t1081)
  %t1082 = load i64, ptr %local.alpha_cb.762
  %t1083 = call i64 @"print_f64"(i64 %t1082)
  %t1084 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.129)
  %t1085 = ptrtoint ptr %t1084 to i64
  %t1086 = inttoptr i64 %t1085 to ptr
  call void @intrinsic_println(ptr %t1086)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t1087 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t1088 = load i64, ptr %local.cycle.769
  %t1089 = icmp eq i64 %t1088, 59
  %t1090 = zext i1 %t1089 to i64
  %t1091 = icmp ne i64 %t1090, 0
  br i1 %t1091, label %then17, label %else17
then17:
  %t1092 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.130)
  %t1093 = ptrtoint ptr %t1092 to i64
  %t1094 = inttoptr i64 %t1093 to ptr
  call void @intrinsic_print(ptr %t1094)
  %t1095 = load i64, ptr %local.loss.771
  %t1096 = call i64 @"print_f64"(i64 %t1095)
  %t1097 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.131)
  %t1098 = ptrtoint ptr %t1097 to i64
  %t1099 = inttoptr i64 %t1098 to ptr
  call void @intrinsic_print(ptr %t1099)
  %t1100 = load i64, ptr %local.drift.772
  %t1101 = call i64 @"print_f64"(i64 %t1100)
  %t1102 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.132)
  %t1103 = ptrtoint ptr %t1102 to i64
  %t1104 = inttoptr i64 %t1103 to ptr
  call void @intrinsic_print(ptr %t1104)
  %t1105 = load i64, ptr %local.alpha_ab.757
  %t1106 = call i64 @"print_f64"(i64 %t1105)
  %t1107 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.133)
  %t1108 = ptrtoint ptr %t1107 to i64
  %t1109 = inttoptr i64 %t1108 to ptr
  call void @intrinsic_print(ptr %t1109)
  %t1110 = load i64, ptr %local.alpha_ac.758
  %t1111 = call i64 @"print_f64"(i64 %t1110)
  %t1112 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.134)
  %t1113 = ptrtoint ptr %t1112 to i64
  %t1114 = inttoptr i64 %t1113 to ptr
  call void @intrinsic_print(ptr %t1114)
  %t1115 = load i64, ptr %local.alpha_ba.759
  %t1116 = call i64 @"print_f64"(i64 %t1115)
  %t1117 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.135)
  %t1118 = ptrtoint ptr %t1117 to i64
  %t1119 = inttoptr i64 %t1118 to ptr
  call void @intrinsic_print(ptr %t1119)
  %t1120 = load i64, ptr %local.alpha_bc.760
  %t1121 = call i64 @"print_f64"(i64 %t1120)
  %t1122 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.136)
  %t1123 = ptrtoint ptr %t1122 to i64
  %t1124 = inttoptr i64 %t1123 to ptr
  call void @intrinsic_print(ptr %t1124)
  %t1125 = load i64, ptr %local.alpha_ca.761
  %t1126 = call i64 @"print_f64"(i64 %t1125)
  %t1127 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.137)
  %t1128 = ptrtoint ptr %t1127 to i64
  %t1129 = inttoptr i64 %t1128 to ptr
  call void @intrinsic_print(ptr %t1129)
  %t1130 = load i64, ptr %local.alpha_cb.762
  %t1131 = call i64 @"print_f64"(i64 %t1130)
  %t1132 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.138)
  %t1133 = ptrtoint ptr %t1132 to i64
  %t1134 = inttoptr i64 %t1133 to ptr
  call void @intrinsic_println(ptr %t1134)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t1135 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t1136 = load i64, ptr %local.cycle.769
  %t1137 = add i64 %t1136, 1
  store i64 %t1137, ptr %local.cycle.769
  br label %loop14
endloop14:
  %t1138 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.139)
  %t1139 = ptrtoint ptr %t1138 to i64
  %t1140 = inttoptr i64 %t1139 to ptr
  call void @intrinsic_println(ptr %t1140)
  %t1141 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.140)
  %t1142 = ptrtoint ptr %t1141 to i64
  %t1143 = inttoptr i64 %t1142 to ptr
  call void @intrinsic_println(ptr %t1143)
  %t1144 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.141)
  %t1145 = ptrtoint ptr %t1144 to i64
  %t1146 = inttoptr i64 %t1145 to ptr
  call void @intrinsic_println(ptr %t1146)
  %t1147 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.142)
  %t1148 = ptrtoint ptr %t1147 to i64
  %t1149 = inttoptr i64 %t1148 to ptr
  call void @intrinsic_print(ptr %t1149)
  %t1150 = load i64, ptr %local.alpha_ab.757
  %t1151 = call i64 @"print_f64"(i64 %t1150)
  %t1152 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.143)
  %t1153 = ptrtoint ptr %t1152 to i64
  %t1154 = inttoptr i64 %t1153 to ptr
  call void @intrinsic_print(ptr %t1154)
  %t1155 = load i64, ptr %local.alpha_ac.758
  %t1156 = call i64 @"print_f64"(i64 %t1155)
  %t1157 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.144)
  %t1158 = ptrtoint ptr %t1157 to i64
  %t1159 = inttoptr i64 %t1158 to ptr
  call void @intrinsic_println(ptr %t1159)
  %t1160 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.145)
  %t1161 = ptrtoint ptr %t1160 to i64
  %t1162 = inttoptr i64 %t1161 to ptr
  call void @intrinsic_print(ptr %t1162)
  %t1163 = load i64, ptr %local.alpha_ba.759
  %t1164 = call i64 @"print_f64"(i64 %t1163)
  %t1165 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.146)
  %t1166 = ptrtoint ptr %t1165 to i64
  %t1167 = inttoptr i64 %t1166 to ptr
  call void @intrinsic_print(ptr %t1167)
  %t1168 = load i64, ptr %local.alpha_bc.760
  %t1169 = call i64 @"print_f64"(i64 %t1168)
  %t1170 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.147)
  %t1171 = ptrtoint ptr %t1170 to i64
  %t1172 = inttoptr i64 %t1171 to ptr
  call void @intrinsic_println(ptr %t1172)
  %t1173 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.148)
  %t1174 = ptrtoint ptr %t1173 to i64
  %t1175 = inttoptr i64 %t1174 to ptr
  call void @intrinsic_print(ptr %t1175)
  %t1176 = load i64, ptr %local.alpha_ca.761
  %t1177 = call i64 @"print_f64"(i64 %t1176)
  %t1178 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.149)
  %t1179 = ptrtoint ptr %t1178 to i64
  %t1180 = inttoptr i64 %t1179 to ptr
  call void @intrinsic_print(ptr %t1180)
  %t1181 = load i64, ptr %local.alpha_cb.762
  %t1182 = call i64 @"print_f64"(i64 %t1181)
  %t1183 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.150)
  %t1184 = ptrtoint ptr %t1183 to i64
  %t1185 = inttoptr i64 %t1184 to ptr
  call void @intrinsic_println(ptr %t1185)
  %t1186 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.151)
  %t1187 = ptrtoint ptr %t1186 to i64
  %t1188 = inttoptr i64 %t1187 to ptr
  call void @intrinsic_println(ptr %t1188)
  %t1189 = load i64, ptr %local.alpha_ab.757
  store i64 %t1189, ptr %local.max_alpha.773
  %t1190 = load i64, ptr %local.alpha_ac.758
  %t1191 = load i64, ptr %local.max_alpha.773
  %t1192 = call i64 @"sx_f64_gt"(i64 %t1190, i64 %t1191)
  %t1193 = icmp ne i64 %t1192, 0
  br i1 %t1193, label %then18, label %else18
then18:
  %t1194 = load i64, ptr %local.alpha_ac.758
  store i64 %t1194, ptr %local.max_alpha.773
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t1195 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t1196 = load i64, ptr %local.alpha_ba.759
  %t1197 = load i64, ptr %local.max_alpha.773
  %t1198 = call i64 @"sx_f64_gt"(i64 %t1196, i64 %t1197)
  %t1199 = icmp ne i64 %t1198, 0
  br i1 %t1199, label %then19, label %else19
then19:
  %t1200 = load i64, ptr %local.alpha_ba.759
  store i64 %t1200, ptr %local.max_alpha.773
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t1201 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t1202 = load i64, ptr %local.alpha_bc.760
  %t1203 = load i64, ptr %local.max_alpha.773
  %t1204 = call i64 @"sx_f64_gt"(i64 %t1202, i64 %t1203)
  %t1205 = icmp ne i64 %t1204, 0
  br i1 %t1205, label %then20, label %else20
then20:
  %t1206 = load i64, ptr %local.alpha_bc.760
  store i64 %t1206, ptr %local.max_alpha.773
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t1207 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t1208 = load i64, ptr %local.alpha_ca.761
  %t1209 = load i64, ptr %local.max_alpha.773
  %t1210 = call i64 @"sx_f64_gt"(i64 %t1208, i64 %t1209)
  %t1211 = icmp ne i64 %t1210, 0
  br i1 %t1211, label %then21, label %else21
then21:
  %t1212 = load i64, ptr %local.alpha_ca.761
  store i64 %t1212, ptr %local.max_alpha.773
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t1213 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t1214 = load i64, ptr %local.alpha_cb.762
  %t1215 = load i64, ptr %local.max_alpha.773
  %t1216 = call i64 @"sx_f64_gt"(i64 %t1214, i64 %t1215)
  %t1217 = icmp ne i64 %t1216, 0
  br i1 %t1217, label %then22, label %else22
then22:
  %t1218 = load i64, ptr %local.alpha_cb.762
  store i64 %t1218, ptr %local.max_alpha.773
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t1219 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t1220 = load i64, ptr %local.alpha_ab.757
  store i64 %t1220, ptr %local.min_alpha.774
  %t1221 = load i64, ptr %local.alpha_ac.758
  %t1222 = load i64, ptr %local.min_alpha.774
  %t1223 = call i64 @"sx_f64_lt"(i64 %t1221, i64 %t1222)
  %t1224 = icmp ne i64 %t1223, 0
  br i1 %t1224, label %then23, label %else23
then23:
  %t1225 = load i64, ptr %local.alpha_ac.758
  store i64 %t1225, ptr %local.min_alpha.774
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t1226 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t1227 = load i64, ptr %local.alpha_ba.759
  %t1228 = load i64, ptr %local.min_alpha.774
  %t1229 = call i64 @"sx_f64_lt"(i64 %t1227, i64 %t1228)
  %t1230 = icmp ne i64 %t1229, 0
  br i1 %t1230, label %then24, label %else24
then24:
  %t1231 = load i64, ptr %local.alpha_ba.759
  store i64 %t1231, ptr %local.min_alpha.774
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t1232 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t1233 = load i64, ptr %local.alpha_bc.760
  %t1234 = load i64, ptr %local.min_alpha.774
  %t1235 = call i64 @"sx_f64_lt"(i64 %t1233, i64 %t1234)
  %t1236 = icmp ne i64 %t1235, 0
  br i1 %t1236, label %then25, label %else25
then25:
  %t1237 = load i64, ptr %local.alpha_bc.760
  store i64 %t1237, ptr %local.min_alpha.774
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t1238 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t1239 = load i64, ptr %local.alpha_ca.761
  %t1240 = load i64, ptr %local.min_alpha.774
  %t1241 = call i64 @"sx_f64_lt"(i64 %t1239, i64 %t1240)
  %t1242 = icmp ne i64 %t1241, 0
  br i1 %t1242, label %then26, label %else26
then26:
  %t1243 = load i64, ptr %local.alpha_ca.761
  store i64 %t1243, ptr %local.min_alpha.774
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t1244 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t1245 = load i64, ptr %local.alpha_cb.762
  %t1246 = load i64, ptr %local.min_alpha.774
  %t1247 = call i64 @"sx_f64_lt"(i64 %t1245, i64 %t1246)
  %t1248 = icmp ne i64 %t1247, 0
  br i1 %t1248, label %then27, label %else27
then27:
  %t1249 = load i64, ptr %local.alpha_cb.762
  store i64 %t1249, ptr %local.min_alpha.774
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t1250 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t1251 = load i64, ptr %local.max_alpha.773
  %t1252 = load i64, ptr %local.min_alpha.774
  %t1253 = call i64 @"sx_f64_sub"(i64 %t1251, i64 %t1252)
  store i64 %t1253, ptr %local.asym.775
  %t1254 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.152)
  %t1255 = ptrtoint ptr %t1254 to i64
  %t1256 = inttoptr i64 %t1255 to ptr
  call void @intrinsic_print(ptr %t1256)
  %t1257 = load i64, ptr %local.asym.775
  %t1258 = call i64 @"print_f64"(i64 %t1257)
  %t1259 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.153)
  %t1260 = ptrtoint ptr %t1259 to i64
  %t1261 = inttoptr i64 %t1260 to ptr
  call void @intrinsic_println(ptr %t1261)
  %t1262 = load i64, ptr %local.asym.775
  %t1263 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.154)
  %t1264 = call i64 @"sx_f64_gt"(i64 %t1262, i64 %t1263)
  %t1265 = icmp ne i64 %t1264, 0
  br i1 %t1265, label %then28, label %else28
then28:
  %t1266 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.155)
  %t1267 = ptrtoint ptr %t1266 to i64
  %t1268 = inttoptr i64 %t1267 to ptr
  call void @intrinsic_println(ptr %t1268)
  %t1269 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.156)
  %t1270 = ptrtoint ptr %t1269 to i64
  %t1271 = inttoptr i64 %t1270 to ptr
  call void @intrinsic_println(ptr %t1271)
  br label %then28_end
then28_end:
  br label %endif28
else28:
  %t1272 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.157)
  %t1273 = ptrtoint ptr %t1272 to i64
  %t1274 = inttoptr i64 %t1273 to ptr
  call void @intrinsic_println(ptr %t1274)
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1275 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t1276 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.158)
  %t1277 = ptrtoint ptr %t1276 to i64
  %t1278 = inttoptr i64 %t1277 to ptr
  call void @intrinsic_println(ptr %t1278)
  ret i64 0
}

define i64 @"exp2_loss_k"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %k) nounwind {
entry:
  %local.total.1279 = alloca i64
  %local.i.1280 = alloca i64
  %local.t0.1281 = alloca i64
  %local.t1.1282 = alloca i64
  %local.t2.1283 = alloca i64
  %local.t3.1284 = alloca i64
  %local.r.1285 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.k = alloca i64
  store i64 %k, ptr %local.k
  %t1286 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.159)
  store i64 %t1286, ptr %local.total.1279
  store i64 0, ptr %local.i.1280
  %t1287 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.160)
  store i64 %t1287, ptr %local.t0.1281
  %t1288 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.161)
  store i64 %t1288, ptr %local.t1.1282
  %t1289 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.162)
  store i64 %t1289, ptr %local.t2.1283
  %t1290 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.163)
  store i64 %t1290, ptr %local.t3.1284
  store i64 0, ptr %local.r.1285
  br label %loop29
loop29:
  %t1291 = load i64, ptr %local.i.1280
  %t1292 = load i64, ptr %local.k
  %t1293 = icmp slt i64 %t1291, %t1292
  %t1294 = zext i1 %t1293 to i64
  %t1295 = icmp ne i64 %t1294, 0
  br i1 %t1295, label %body29, label %endloop29
body29:
  %t1296 = load i64, ptr %local.i.1280
  %t1297 = load i64, ptr %local.i.1280
  %t1298 = sdiv i64 %t1297, 4
  %t1299 = mul i64 %t1298, 4
  %t1300 = sub i64 %t1296, %t1299
  store i64 %t1300, ptr %local.r.1285
  %t1301 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.164)
  store i64 %t1301, ptr %local.t0.1281
  %t1302 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.165)
  store i64 %t1302, ptr %local.t1.1282
  %t1303 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.166)
  store i64 %t1303, ptr %local.t2.1283
  %t1304 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.167)
  store i64 %t1304, ptr %local.t3.1284
  %t1305 = load i64, ptr %local.r.1285
  %t1306 = icmp eq i64 %t1305, 0
  %t1307 = zext i1 %t1306 to i64
  %t1308 = icmp ne i64 %t1307, 0
  br i1 %t1308, label %then30, label %else30
then30:
  %t1309 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.168)
  store i64 %t1309, ptr %local.t0.1281
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1310 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t1311 = load i64, ptr %local.r.1285
  %t1312 = icmp eq i64 %t1311, 1
  %t1313 = zext i1 %t1312 to i64
  %t1314 = icmp ne i64 %t1313, 0
  br i1 %t1314, label %then31, label %else31
then31:
  %t1315 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.169)
  store i64 %t1315, ptr %local.t1.1282
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1316 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1317 = load i64, ptr %local.r.1285
  %t1318 = icmp eq i64 %t1317, 2
  %t1319 = zext i1 %t1318 to i64
  %t1320 = icmp ne i64 %t1319, 0
  br i1 %t1320, label %then32, label %else32
then32:
  %t1321 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.170)
  store i64 %t1321, ptr %local.t2.1283
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1322 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t1323 = load i64, ptr %local.r.1285
  %t1324 = icmp eq i64 %t1323, 3
  %t1325 = zext i1 %t1324 to i64
  %t1326 = icmp ne i64 %t1325, 0
  br i1 %t1326, label %then33, label %else33
then33:
  %t1327 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.171)
  store i64 %t1327, ptr %local.t3.1284
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1328 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t1329 = load i64, ptr %local.total.1279
  %t1330 = load i64, ptr %local.w0
  %t1331 = load i64, ptr %local.w1
  %t1332 = load i64, ptr %local.w2
  %t1333 = load i64, ptr %local.w3
  %t1334 = load i64, ptr %local.t0.1281
  %t1335 = load i64, ptr %local.t1.1282
  %t1336 = load i64, ptr %local.t2.1283
  %t1337 = load i64, ptr %local.t3.1284
  %t1338 = call i64 @"loss4"(i64 %t1330, i64 %t1331, i64 %t1332, i64 %t1333, i64 %t1334, i64 %t1335, i64 %t1336, i64 %t1337)
  %t1339 = call i64 @"sx_f64_add"(i64 %t1329, i64 %t1338)
  store i64 %t1339, ptr %local.total.1279
  %t1340 = load i64, ptr %local.i.1280
  %t1341 = add i64 %t1340, 1
  store i64 %t1341, ptr %local.i.1280
  br label %loop29
endloop29:
  %t1342 = load i64, ptr %local.total.1279
  ret i64 %t1342
}

define i64 @"exp2_grad_dim"(i64 %w, i64 %k, i64 %dim) nounwind {
entry:
  %local.total.1343 = alloca i64
  %local.i.1344 = alloca i64
  %local.r.1345 = alloca i64
  %local.t.1346 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.k = alloca i64
  store i64 %k, ptr %local.k
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t1347 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.172)
  store i64 %t1347, ptr %local.total.1343
  store i64 0, ptr %local.i.1344
  store i64 0, ptr %local.r.1345
  %t1348 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.173)
  store i64 %t1348, ptr %local.t.1346
  br label %loop34
loop34:
  %t1349 = load i64, ptr %local.i.1344
  %t1350 = load i64, ptr %local.k
  %t1351 = icmp slt i64 %t1349, %t1350
  %t1352 = zext i1 %t1351 to i64
  %t1353 = icmp ne i64 %t1352, 0
  br i1 %t1353, label %body34, label %endloop34
body34:
  %t1354 = load i64, ptr %local.i.1344
  %t1355 = load i64, ptr %local.i.1344
  %t1356 = sdiv i64 %t1355, 4
  %t1357 = mul i64 %t1356, 4
  %t1358 = sub i64 %t1354, %t1357
  store i64 %t1358, ptr %local.r.1345
  %t1359 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.174)
  store i64 %t1359, ptr %local.t.1346
  %t1360 = load i64, ptr %local.r.1345
  %t1361 = load i64, ptr %local.dim
  %t1362 = icmp eq i64 %t1360, %t1361
  %t1363 = zext i1 %t1362 to i64
  %t1364 = icmp ne i64 %t1363, 0
  br i1 %t1364, label %then35, label %else35
then35:
  %t1365 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.175)
  store i64 %t1365, ptr %local.t.1346
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1366 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t1367 = load i64, ptr %local.total.1343
  %t1368 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.176)
  %t1369 = load i64, ptr %local.w
  %t1370 = load i64, ptr %local.t.1346
  %t1371 = call i64 @"sx_f64_sub"(i64 %t1369, i64 %t1370)
  %t1372 = call i64 @"sx_f64_mul"(i64 %t1368, i64 %t1371)
  %t1373 = call i64 @"sx_f64_add"(i64 %t1367, i64 %t1372)
  store i64 %t1373, ptr %local.total.1343
  %t1374 = load i64, ptr %local.i.1344
  %t1375 = add i64 %t1374, 1
  store i64 %t1375, ptr %local.i.1344
  br label %loop34
endloop34:
  %t1376 = load i64, ptr %local.total.1343
  ret i64 %t1376
}

define i64 @"exp2_run_cycle"(i64 %alpha, i64 %k, i64 %steps) nounwind {
entry:
  %local.w0.1377 = alloca i64
  %local.w1.1378 = alloca i64
  %local.w2.1379 = alloca i64
  %local.w3.1380 = alloca i64
  %local.step.1381 = alloca i64
  %local.g0.1382 = alloca i64
  %local.g1.1383 = alloca i64
  %local.g2.1384 = alloca i64
  %local.g3.1385 = alloca i64
  %local.lr.1386 = alloca i64
  %local.ki.1387 = alloca i64
  %local.damp.1388 = alloca i64
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.k = alloca i64
  store i64 %k, ptr %local.k
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1389 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.177)
  store i64 %t1389, ptr %local.w0.1377
  %t1390 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.178)
  store i64 %t1390, ptr %local.w1.1378
  %t1391 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.179)
  store i64 %t1391, ptr %local.w2.1379
  %t1392 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.180)
  store i64 %t1392, ptr %local.w3.1380
  store i64 0, ptr %local.step.1381
  %t1393 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.181)
  store i64 %t1393, ptr %local.g0.1382
  %t1394 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.182)
  store i64 %t1394, ptr %local.g1.1383
  %t1395 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.183)
  store i64 %t1395, ptr %local.g2.1384
  %t1396 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.184)
  store i64 %t1396, ptr %local.g3.1385
  %t1397 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.185)
  store i64 %t1397, ptr %local.lr.1386
  br label %loop36
loop36:
  %t1398 = load i64, ptr %local.step.1381
  %t1399 = load i64, ptr %local.steps
  %t1400 = icmp slt i64 %t1398, %t1399
  %t1401 = zext i1 %t1400 to i64
  %t1402 = icmp ne i64 %t1401, 0
  br i1 %t1402, label %body36, label %endloop36
body36:
  %t1403 = load i64, ptr %local.w0.1377
  %t1404 = load i64, ptr %local.k
  %t1405 = call i64 @"exp2_grad_dim"(i64 %t1403, i64 %t1404, i64 0)
  store i64 %t1405, ptr %local.g0.1382
  %t1406 = load i64, ptr %local.w1.1378
  %t1407 = load i64, ptr %local.k
  %t1408 = call i64 @"exp2_grad_dim"(i64 %t1406, i64 %t1407, i64 1)
  store i64 %t1408, ptr %local.g1.1383
  %t1409 = load i64, ptr %local.w2.1379
  %t1410 = load i64, ptr %local.k
  %t1411 = call i64 @"exp2_grad_dim"(i64 %t1409, i64 %t1410, i64 2)
  store i64 %t1411, ptr %local.g2.1384
  %t1412 = load i64, ptr %local.w3.1380
  %t1413 = load i64, ptr %local.k
  %t1414 = call i64 @"exp2_grad_dim"(i64 %t1412, i64 %t1413, i64 3)
  store i64 %t1414, ptr %local.g3.1385
  %t1415 = load i64, ptr %local.k
  %t1416 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.186)
  %t1417 = call i64 @"sx_f64_mul"(i64 %t1415, i64 %t1416)
  store i64 %t1417, ptr %local.ki.1387
  %t1418 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.187)
  %t1419 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.188)
  %t1420 = load i64, ptr %local.alpha
  %t1421 = load i64, ptr %local.ki.1387
  %t1422 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.189)
  %t1423 = call i64 @"sx_f64_sub"(i64 %t1421, i64 %t1422)
  %t1424 = call i64 @"sx_f64_mul"(i64 %t1420, i64 %t1423)
  %t1425 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.190)
  %t1426 = call i64 @"sx_f64_mul"(i64 %t1424, i64 %t1425)
  %t1427 = call i64 @"sx_f64_add"(i64 %t1419, i64 %t1426)
  %t1428 = call i64 @"sx_f64_div"(i64 %t1418, i64 %t1427)
  store i64 %t1428, ptr %local.damp.1388
  %t1429 = load i64, ptr %local.w0.1377
  %t1430 = load i64, ptr %local.lr.1386
  %t1431 = load i64, ptr %local.g0.1382
  %t1432 = call i64 @"sx_f64_mul"(i64 %t1430, i64 %t1431)
  %t1433 = load i64, ptr %local.damp.1388
  %t1434 = call i64 @"sx_f64_mul"(i64 %t1432, i64 %t1433)
  %t1435 = call i64 @"sx_f64_sub"(i64 %t1429, i64 %t1434)
  store i64 %t1435, ptr %local.w0.1377
  %t1436 = load i64, ptr %local.w1.1378
  %t1437 = load i64, ptr %local.lr.1386
  %t1438 = load i64, ptr %local.g1.1383
  %t1439 = call i64 @"sx_f64_mul"(i64 %t1437, i64 %t1438)
  %t1440 = load i64, ptr %local.damp.1388
  %t1441 = call i64 @"sx_f64_mul"(i64 %t1439, i64 %t1440)
  %t1442 = call i64 @"sx_f64_sub"(i64 %t1436, i64 %t1441)
  store i64 %t1442, ptr %local.w1.1378
  %t1443 = load i64, ptr %local.w2.1379
  %t1444 = load i64, ptr %local.lr.1386
  %t1445 = load i64, ptr %local.g2.1384
  %t1446 = call i64 @"sx_f64_mul"(i64 %t1444, i64 %t1445)
  %t1447 = load i64, ptr %local.damp.1388
  %t1448 = call i64 @"sx_f64_mul"(i64 %t1446, i64 %t1447)
  %t1449 = call i64 @"sx_f64_sub"(i64 %t1443, i64 %t1448)
  store i64 %t1449, ptr %local.w2.1379
  %t1450 = load i64, ptr %local.w3.1380
  %t1451 = load i64, ptr %local.lr.1386
  %t1452 = load i64, ptr %local.g3.1385
  %t1453 = call i64 @"sx_f64_mul"(i64 %t1451, i64 %t1452)
  %t1454 = load i64, ptr %local.damp.1388
  %t1455 = call i64 @"sx_f64_mul"(i64 %t1453, i64 %t1454)
  %t1456 = call i64 @"sx_f64_sub"(i64 %t1450, i64 %t1455)
  store i64 %t1456, ptr %local.w3.1380
  %t1457 = load i64, ptr %local.step.1381
  %t1458 = add i64 %t1457, 1
  store i64 %t1458, ptr %local.step.1381
  br label %loop36
endloop36:
  %t1459 = load i64, ptr %local.w0.1377
  %t1460 = load i64, ptr %local.w1.1378
  %t1461 = load i64, ptr %local.w2.1379
  %t1462 = load i64, ptr %local.w3.1380
  %t1463 = load i64, ptr %local.k
  %t1464 = call i64 @"exp2_loss_k"(i64 %t1459, i64 %t1460, i64 %t1461, i64 %t1462, i64 %t1463)
  ret i64 %t1464
}

define i64 @"exp2_meta_grad"(i64 %alpha, i64 %k, i64 %steps) nounwind {
entry:
  %local.h.1465 = alloca i64
  %local.lp.1466 = alloca i64
  %local.lm.1467 = alloca i64
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.k = alloca i64
  store i64 %k, ptr %local.k
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1468 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.191)
  store i64 %t1468, ptr %local.h.1465
  %t1469 = load i64, ptr %local.alpha
  %t1470 = load i64, ptr %local.h.1465
  %t1471 = call i64 @"sx_f64_add"(i64 %t1469, i64 %t1470)
  %t1472 = load i64, ptr %local.k
  %t1473 = load i64, ptr %local.steps
  %t1474 = call i64 @"exp2_run_cycle"(i64 %t1471, i64 %t1472, i64 %t1473)
  store i64 %t1474, ptr %local.lp.1466
  %t1475 = load i64, ptr %local.alpha
  %t1476 = load i64, ptr %local.h.1465
  %t1477 = call i64 @"sx_f64_sub"(i64 %t1475, i64 %t1476)
  %t1478 = load i64, ptr %local.k
  %t1479 = load i64, ptr %local.steps
  %t1480 = call i64 @"exp2_run_cycle"(i64 %t1477, i64 %t1478, i64 %t1479)
  store i64 %t1480, ptr %local.lm.1467
  %t1481 = load i64, ptr %local.lp.1466
  %t1482 = load i64, ptr %local.lm.1467
  %t1483 = call i64 @"sx_f64_sub"(i64 %t1481, i64 %t1482)
  %t1484 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.192)
  %t1485 = load i64, ptr %local.h.1465
  %t1486 = call i64 @"sx_f64_mul"(i64 %t1484, i64 %t1485)
  %t1487 = call i64 @"sx_f64_div"(i64 %t1483, i64 %t1486)
  ret i64 %t1487
}

define i64 @"run_exp2_for_k"(i64 %k) nounwind {
entry:
  %local.alpha.1488 = alloca i64
  %local.prev_alpha.1489 = alloca i64
  %local.cycle.1490 = alloca i64
  %local.mg.1491 = alloca i64
  %local.loss.1492 = alloca i64
  %local.drift.1493 = alloca i64
  %local.converge_cycle.1494 = alloca i64
  %local.converged.1495 = alloca i64
  %local.meta_lr.1496 = alloca i64
  %local.inner_steps.1497 = alloca i64
  %local.meta_cycles.1498 = alloca i64
  %local.ki.1499 = alloca i64
  %local.loss_per_k.1500 = alloca i64
  %local.k = alloca i64
  store i64 %k, ptr %local.k
  %t1501 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.193)
  store i64 %t1501, ptr %local.alpha.1488
  %t1502 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.194)
  store i64 %t1502, ptr %local.prev_alpha.1489
  store i64 0, ptr %local.cycle.1490
  %t1503 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.195)
  store i64 %t1503, ptr %local.mg.1491
  %t1504 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.196)
  store i64 %t1504, ptr %local.loss.1492
  %t1505 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.197)
  store i64 %t1505, ptr %local.drift.1493
  store i64 0, ptr %local.converge_cycle.1494
  store i64 0, ptr %local.converged.1495
  %t1506 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.198)
  store i64 %t1506, ptr %local.meta_lr.1496
  store i64 200, ptr %local.inner_steps.1497
  store i64 40, ptr %local.meta_cycles.1498
  br label %loop37
loop37:
  %t1507 = load i64, ptr %local.cycle.1490
  %t1508 = load i64, ptr %local.meta_cycles.1498
  %t1509 = icmp slt i64 %t1507, %t1508
  %t1510 = zext i1 %t1509 to i64
  %t1511 = icmp ne i64 %t1510, 0
  br i1 %t1511, label %body37, label %endloop37
body37:
  %t1512 = load i64, ptr %local.alpha.1488
  store i64 %t1512, ptr %local.prev_alpha.1489
  %t1513 = load i64, ptr %local.alpha.1488
  %t1514 = load i64, ptr %local.k
  %t1515 = load i64, ptr %local.inner_steps.1497
  %t1516 = call i64 @"exp2_meta_grad"(i64 %t1513, i64 %t1514, i64 %t1515)
  store i64 %t1516, ptr %local.mg.1491
  %t1517 = load i64, ptr %local.alpha.1488
  %t1518 = load i64, ptr %local.meta_lr.1496
  %t1519 = load i64, ptr %local.mg.1491
  %t1520 = call i64 @"sx_f64_mul"(i64 %t1518, i64 %t1519)
  %t1521 = call i64 @"sx_f64_sub"(i64 %t1517, i64 %t1520)
  %t1522 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.199)
  %t1523 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.200)
  %t1524 = call i64 @"clamp"(i64 %t1521, i64 %t1522, i64 %t1523)
  store i64 %t1524, ptr %local.alpha.1488
  %t1525 = load i64, ptr %local.alpha.1488
  %t1526 = load i64, ptr %local.k
  %t1527 = load i64, ptr %local.inner_steps.1497
  %t1528 = call i64 @"exp2_run_cycle"(i64 %t1525, i64 %t1526, i64 %t1527)
  store i64 %t1528, ptr %local.loss.1492
  %t1529 = load i64, ptr %local.alpha.1488
  %t1530 = load i64, ptr %local.prev_alpha.1489
  %t1531 = call i64 @"sx_f64_sub"(i64 %t1529, i64 %t1530)
  %t1532 = call i64 @"abs_f64"(i64 %t1531)
  store i64 %t1532, ptr %local.drift.1493
  %t1533 = load i64, ptr %local.drift.1493
  %t1534 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.201)
  %t1535 = call i64 @"sx_f64_lt"(i64 %t1533, i64 %t1534)
  %t1536 = icmp ne i64 %t1535, 0
  br i1 %t1536, label %then38, label %else38
then38:
  %t1537 = load i64, ptr %local.converged.1495
  %t1538 = icmp eq i64 %t1537, 0
  %t1539 = zext i1 %t1538 to i64
  %t1540 = icmp ne i64 %t1539, 0
  br i1 %t1540, label %then39, label %else39
then39:
  %t1541 = load i64, ptr %local.cycle.1490
  store i64 %t1541, ptr %local.converge_cycle.1494
  store i64 1, ptr %local.converged.1495
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1542 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1543 = phi i64 [ %t1542, %then38_end ], [ 0, %else38_end ]
  %t1544 = load i64, ptr %local.cycle.1490
  %t1545 = add i64 %t1544, 1
  store i64 %t1545, ptr %local.cycle.1490
  br label %loop37
endloop37:
  %t1546 = load i64, ptr %local.k
  %t1547 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.202)
  %t1548 = call i64 @"sx_f64_mul"(i64 %t1546, i64 %t1547)
  store i64 %t1548, ptr %local.ki.1499
  %t1549 = load i64, ptr %local.loss.1492
  %t1550 = load i64, ptr %local.ki.1499
  %t1551 = call i64 @"sx_f64_div"(i64 %t1549, i64 %t1550)
  store i64 %t1551, ptr %local.loss_per_k.1500
  %t1552 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.203)
  %t1553 = ptrtoint ptr %t1552 to i64
  %t1554 = inttoptr i64 %t1553 to ptr
  call void @intrinsic_print(ptr %t1554)
  %t1555 = load i64, ptr %local.k
  call void @print_i64(i64 %t1555)
  %t1556 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.204)
  %t1557 = ptrtoint ptr %t1556 to i64
  %t1558 = inttoptr i64 %t1557 to ptr
  call void @intrinsic_print(ptr %t1558)
  %t1559 = load i64, ptr %local.loss.1492
  %t1560 = call i64 @"print_f64"(i64 %t1559)
  %t1561 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.205)
  %t1562 = ptrtoint ptr %t1561 to i64
  %t1563 = inttoptr i64 %t1562 to ptr
  call void @intrinsic_print(ptr %t1563)
  %t1564 = load i64, ptr %local.loss_per_k.1500
  %t1565 = call i64 @"print_f64"(i64 %t1564)
  %t1566 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.206)
  %t1567 = ptrtoint ptr %t1566 to i64
  %t1568 = inttoptr i64 %t1567 to ptr
  call void @intrinsic_print(ptr %t1568)
  %t1569 = load i64, ptr %local.alpha.1488
  %t1570 = call i64 @"print_f64"(i64 %t1569)
  %t1571 = load i64, ptr %local.converged.1495
  %t1572 = icmp eq i64 %t1571, 1
  %t1573 = zext i1 %t1572 to i64
  %t1574 = icmp ne i64 %t1573, 0
  br i1 %t1574, label %then40, label %else40
then40:
  %t1575 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.207)
  %t1576 = ptrtoint ptr %t1575 to i64
  %t1577 = inttoptr i64 %t1576 to ptr
  call void @intrinsic_print(ptr %t1577)
  %t1578 = load i64, ptr %local.converge_cycle.1494
  call void @print_i64(i64 %t1578)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  %t1579 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.208)
  %t1580 = ptrtoint ptr %t1579 to i64
  %t1581 = inttoptr i64 %t1580 to ptr
  call void @intrinsic_print(ptr %t1581)
  %t1582 = load i64, ptr %local.drift.1493
  %t1583 = call i64 @"print_f64"(i64 %t1582)
  %t1584 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.209)
  %t1585 = ptrtoint ptr %t1584 to i64
  %t1586 = inttoptr i64 %t1585 to ptr
  call void @intrinsic_print(ptr %t1586)
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1587 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t1588 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.210)
  %t1589 = ptrtoint ptr %t1588 to i64
  %t1590 = inttoptr i64 %t1589 to ptr
  call void @intrinsic_println(ptr %t1590)
  %t1591 = load i64, ptr %local.converged.1495
  ret i64 %t1591
}

define i64 @"run_exp2"() nounwind {
entry:
  %local.k.1592 = alloca i64
  %local.conv.1593 = alloca i64
  %local.prev_conv.1594 = alloca i64
  %local.phase_k.1595 = alloca i64
  store i64 2, ptr %local.k.1592
  store i64 0, ptr %local.conv.1593
  store i64 1, ptr %local.prev_conv.1594
  store i64 0, ptr %local.phase_k.1595
  %t1596 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.211)
  %t1597 = ptrtoint ptr %t1596 to i64
  %t1598 = inttoptr i64 %t1597 to ptr
  call void @intrinsic_println(ptr %t1598)
  %t1599 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.212)
  %t1600 = ptrtoint ptr %t1599 to i64
  %t1601 = inttoptr i64 %t1600 to ptr
  call void @intrinsic_println(ptr %t1601)
  %t1602 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.213)
  %t1603 = ptrtoint ptr %t1602 to i64
  %t1604 = inttoptr i64 %t1603 to ptr
  call void @intrinsic_println(ptr %t1604)
  %t1605 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.214)
  %t1606 = ptrtoint ptr %t1605 to i64
  %t1607 = inttoptr i64 %t1606 to ptr
  call void @intrinsic_println(ptr %t1607)
  %t1608 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.215)
  %t1609 = ptrtoint ptr %t1608 to i64
  %t1610 = inttoptr i64 %t1609 to ptr
  call void @intrinsic_println(ptr %t1610)
  %t1611 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.216)
  %t1612 = ptrtoint ptr %t1611 to i64
  %t1613 = inttoptr i64 %t1612 to ptr
  call void @intrinsic_println(ptr %t1613)
  br label %loop41
loop41:
  %t1614 = load i64, ptr %local.k.1592
  %t1615 = icmp sle i64 %t1614, 8
  %t1616 = zext i1 %t1615 to i64
  %t1617 = icmp ne i64 %t1616, 0
  br i1 %t1617, label %body41, label %endloop41
body41:
  %t1618 = load i64, ptr %local.k.1592
  %t1619 = call i64 @"run_exp2_for_k"(i64 %t1618)
  store i64 %t1619, ptr %local.conv.1593
  %t1620 = load i64, ptr %local.prev_conv.1594
  %t1621 = icmp eq i64 %t1620, 1
  %t1622 = zext i1 %t1621 to i64
  %t1623 = icmp ne i64 %t1622, 0
  br i1 %t1623, label %then42, label %else42
then42:
  %t1624 = load i64, ptr %local.conv.1593
  %t1625 = icmp eq i64 %t1624, 0
  %t1626 = zext i1 %t1625 to i64
  %t1627 = icmp ne i64 %t1626, 0
  br i1 %t1627, label %then43, label %else43
then43:
  %t1628 = load i64, ptr %local.k.1592
  store i64 %t1628, ptr %local.phase_k.1595
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1629 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1630 = phi i64 [ %t1629, %then42_end ], [ 0, %else42_end ]
  %t1631 = load i64, ptr %local.conv.1593
  store i64 %t1631, ptr %local.prev_conv.1594
  %t1632 = load i64, ptr %local.k.1592
  %t1633 = add i64 %t1632, 1
  store i64 %t1633, ptr %local.k.1592
  br label %loop41
endloop41:
  %t1634 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.217)
  %t1635 = ptrtoint ptr %t1634 to i64
  %t1636 = inttoptr i64 %t1635 to ptr
  call void @intrinsic_println(ptr %t1636)
  %t1637 = load i64, ptr %local.phase_k.1595
  %t1638 = icmp sgt i64 %t1637, 0
  %t1639 = zext i1 %t1638 to i64
  %t1640 = icmp ne i64 %t1639, 0
  br i1 %t1640, label %then44, label %else44
then44:
  %t1641 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.218)
  %t1642 = ptrtoint ptr %t1641 to i64
  %t1643 = inttoptr i64 %t1642 to ptr
  call void @intrinsic_print(ptr %t1643)
  %t1644 = load i64, ptr %local.phase_k.1595
  call void @print_i64(i64 %t1644)
  %t1645 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.219)
  %t1646 = ptrtoint ptr %t1645 to i64
  %t1647 = inttoptr i64 %t1646 to ptr
  call void @intrinsic_println(ptr %t1647)
  %t1648 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.220)
  %t1649 = ptrtoint ptr %t1648 to i64
  %t1650 = inttoptr i64 %t1649 to ptr
  call void @intrinsic_println(ptr %t1650)
  br label %then44_end
then44_end:
  br label %endif44
else44:
  %t1651 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.221)
  %t1652 = ptrtoint ptr %t1651 to i64
  %t1653 = inttoptr i64 %t1652 to ptr
  call void @intrinsic_println(ptr %t1653)
  %t1654 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.222)
  %t1655 = ptrtoint ptr %t1654 to i64
  %t1656 = inttoptr i64 %t1655 to ptr
  call void @intrinsic_println(ptr %t1656)
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1657 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t1658 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.223)
  %t1659 = ptrtoint ptr %t1658 to i64
  %t1660 = inttoptr i64 %t1659 to ptr
  call void @intrinsic_println(ptr %t1660)
  ret i64 0
}

define i64 @"exp3_test_perturbation"(i64 %perturb_size) nounwind {
entry:
  %local.alpha_ab.1661 = alloca i64
  %local.alpha_ac.1662 = alloca i64
  %local.alpha_ba.1663 = alloca i64
  %local.alpha_bc.1664 = alloca i64
  %local.alpha_ca.1665 = alloca i64
  %local.alpha_cb.1666 = alloca i64
  %local.prev_ab.1667 = alloca i64
  %local.cycle.1668 = alloca i64
  %local.mg.1669 = alloca i64
  %local.drift.1670 = alloca i64
  %local.recover_cycle.1671 = alloca i64
  %local.recovered.1672 = alloca i64
  %local.meta_lr.1673 = alloca i64
  %local.inner_steps.1674 = alloca i64
  %local.meta_cycles.1675 = alloca i64
  %local.initial_ab.1676 = alloca i64
  %local.final_dist.1677 = alloca i64
  %local.perturb_size = alloca i64
  store i64 %perturb_size, ptr %local.perturb_size
  %t1678 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.224)
  store i64 %t1678, ptr %local.alpha_ab.1661
  %t1679 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.225)
  store i64 %t1679, ptr %local.alpha_ac.1662
  %t1680 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.226)
  store i64 %t1680, ptr %local.alpha_ba.1663
  %t1681 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.227)
  store i64 %t1681, ptr %local.alpha_bc.1664
  %t1682 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.228)
  store i64 %t1682, ptr %local.alpha_ca.1665
  %t1683 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.229)
  store i64 %t1683, ptr %local.alpha_cb.1666
  %t1684 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.230)
  store i64 %t1684, ptr %local.prev_ab.1667
  store i64 0, ptr %local.cycle.1668
  %t1685 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.231)
  store i64 %t1685, ptr %local.mg.1669
  %t1686 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.232)
  store i64 %t1686, ptr %local.drift.1670
  store i64 0, ptr %local.recover_cycle.1671
  store i64 0, ptr %local.recovered.1672
  %t1687 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.233)
  store i64 %t1687, ptr %local.meta_lr.1673
  store i64 200, ptr %local.inner_steps.1674
  store i64 40, ptr %local.meta_cycles.1675
  %t1688 = load i64, ptr %local.alpha_ab.1661
  %t1689 = load i64, ptr %local.perturb_size
  %t1690 = call i64 @"sx_f64_add"(i64 %t1688, i64 %t1689)
  store i64 %t1690, ptr %local.alpha_ab.1661
  %t1691 = load i64, ptr %local.alpha_ab.1661
  %t1692 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.234)
  %t1693 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.235)
  %t1694 = call i64 @"clamp"(i64 %t1691, i64 %t1692, i64 %t1693)
  store i64 %t1694, ptr %local.alpha_ab.1661
  %t1695 = load i64, ptr %local.alpha_ab.1661
  store i64 %t1695, ptr %local.initial_ab.1676
  br label %loop45
loop45:
  %t1696 = load i64, ptr %local.cycle.1668
  %t1697 = load i64, ptr %local.meta_cycles.1675
  %t1698 = icmp slt i64 %t1696, %t1697
  %t1699 = zext i1 %t1698 to i64
  %t1700 = icmp ne i64 %t1699, 0
  br i1 %t1700, label %body45, label %endloop45
body45:
  %t1701 = load i64, ptr %local.alpha_ab.1661
  store i64 %t1701, ptr %local.prev_ab.1667
  %t1702 = load i64, ptr %local.alpha_ab.1661
  %t1703 = load i64, ptr %local.alpha_ac.1662
  %t1704 = load i64, ptr %local.alpha_ba.1663
  %t1705 = load i64, ptr %local.alpha_bc.1664
  %t1706 = load i64, ptr %local.alpha_ca.1665
  %t1707 = load i64, ptr %local.alpha_cb.1666
  %t1708 = load i64, ptr %local.inner_steps.1674
  %t1709 = call i64 @"exp1_meta_grad"(i64 %t1702, i64 %t1703, i64 %t1704, i64 %t1705, i64 %t1706, i64 %t1707, i64 0, i64 %t1708)
  store i64 %t1709, ptr %local.mg.1669
  %t1710 = load i64, ptr %local.alpha_ab.1661
  %t1711 = load i64, ptr %local.meta_lr.1673
  %t1712 = load i64, ptr %local.mg.1669
  %t1713 = call i64 @"sx_f64_mul"(i64 %t1711, i64 %t1712)
  %t1714 = call i64 @"sx_f64_sub"(i64 %t1710, i64 %t1713)
  %t1715 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.236)
  %t1716 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.237)
  %t1717 = call i64 @"clamp"(i64 %t1714, i64 %t1715, i64 %t1716)
  store i64 %t1717, ptr %local.alpha_ab.1661
  %t1718 = load i64, ptr %local.alpha_ab.1661
  %t1719 = load i64, ptr %local.alpha_ac.1662
  %t1720 = load i64, ptr %local.alpha_ba.1663
  %t1721 = load i64, ptr %local.alpha_bc.1664
  %t1722 = load i64, ptr %local.alpha_ca.1665
  %t1723 = load i64, ptr %local.alpha_cb.1666
  %t1724 = load i64, ptr %local.inner_steps.1674
  %t1725 = call i64 @"exp1_meta_grad"(i64 %t1718, i64 %t1719, i64 %t1720, i64 %t1721, i64 %t1722, i64 %t1723, i64 1, i64 %t1724)
  store i64 %t1725, ptr %local.mg.1669
  %t1726 = load i64, ptr %local.alpha_ac.1662
  %t1727 = load i64, ptr %local.meta_lr.1673
  %t1728 = load i64, ptr %local.mg.1669
  %t1729 = call i64 @"sx_f64_mul"(i64 %t1727, i64 %t1728)
  %t1730 = call i64 @"sx_f64_sub"(i64 %t1726, i64 %t1729)
  %t1731 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.238)
  %t1732 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.239)
  %t1733 = call i64 @"clamp"(i64 %t1730, i64 %t1731, i64 %t1732)
  store i64 %t1733, ptr %local.alpha_ac.1662
  %t1734 = load i64, ptr %local.alpha_ab.1661
  %t1735 = load i64, ptr %local.alpha_ac.1662
  %t1736 = load i64, ptr %local.alpha_ba.1663
  %t1737 = load i64, ptr %local.alpha_bc.1664
  %t1738 = load i64, ptr %local.alpha_ca.1665
  %t1739 = load i64, ptr %local.alpha_cb.1666
  %t1740 = load i64, ptr %local.inner_steps.1674
  %t1741 = call i64 @"exp1_meta_grad"(i64 %t1734, i64 %t1735, i64 %t1736, i64 %t1737, i64 %t1738, i64 %t1739, i64 2, i64 %t1740)
  store i64 %t1741, ptr %local.mg.1669
  %t1742 = load i64, ptr %local.alpha_ba.1663
  %t1743 = load i64, ptr %local.meta_lr.1673
  %t1744 = load i64, ptr %local.mg.1669
  %t1745 = call i64 @"sx_f64_mul"(i64 %t1743, i64 %t1744)
  %t1746 = call i64 @"sx_f64_sub"(i64 %t1742, i64 %t1745)
  %t1747 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.240)
  %t1748 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.241)
  %t1749 = call i64 @"clamp"(i64 %t1746, i64 %t1747, i64 %t1748)
  store i64 %t1749, ptr %local.alpha_ba.1663
  %t1750 = load i64, ptr %local.alpha_ab.1661
  %t1751 = load i64, ptr %local.alpha_ac.1662
  %t1752 = load i64, ptr %local.alpha_ba.1663
  %t1753 = load i64, ptr %local.alpha_bc.1664
  %t1754 = load i64, ptr %local.alpha_ca.1665
  %t1755 = load i64, ptr %local.alpha_cb.1666
  %t1756 = load i64, ptr %local.inner_steps.1674
  %t1757 = call i64 @"exp1_meta_grad"(i64 %t1750, i64 %t1751, i64 %t1752, i64 %t1753, i64 %t1754, i64 %t1755, i64 3, i64 %t1756)
  store i64 %t1757, ptr %local.mg.1669
  %t1758 = load i64, ptr %local.alpha_bc.1664
  %t1759 = load i64, ptr %local.meta_lr.1673
  %t1760 = load i64, ptr %local.mg.1669
  %t1761 = call i64 @"sx_f64_mul"(i64 %t1759, i64 %t1760)
  %t1762 = call i64 @"sx_f64_sub"(i64 %t1758, i64 %t1761)
  %t1763 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.242)
  %t1764 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.243)
  %t1765 = call i64 @"clamp"(i64 %t1762, i64 %t1763, i64 %t1764)
  store i64 %t1765, ptr %local.alpha_bc.1664
  %t1766 = load i64, ptr %local.alpha_ab.1661
  %t1767 = load i64, ptr %local.alpha_ac.1662
  %t1768 = load i64, ptr %local.alpha_ba.1663
  %t1769 = load i64, ptr %local.alpha_bc.1664
  %t1770 = load i64, ptr %local.alpha_ca.1665
  %t1771 = load i64, ptr %local.alpha_cb.1666
  %t1772 = load i64, ptr %local.inner_steps.1674
  %t1773 = call i64 @"exp1_meta_grad"(i64 %t1766, i64 %t1767, i64 %t1768, i64 %t1769, i64 %t1770, i64 %t1771, i64 4, i64 %t1772)
  store i64 %t1773, ptr %local.mg.1669
  %t1774 = load i64, ptr %local.alpha_ca.1665
  %t1775 = load i64, ptr %local.meta_lr.1673
  %t1776 = load i64, ptr %local.mg.1669
  %t1777 = call i64 @"sx_f64_mul"(i64 %t1775, i64 %t1776)
  %t1778 = call i64 @"sx_f64_sub"(i64 %t1774, i64 %t1777)
  %t1779 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.244)
  %t1780 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.245)
  %t1781 = call i64 @"clamp"(i64 %t1778, i64 %t1779, i64 %t1780)
  store i64 %t1781, ptr %local.alpha_ca.1665
  %t1782 = load i64, ptr %local.alpha_ab.1661
  %t1783 = load i64, ptr %local.alpha_ac.1662
  %t1784 = load i64, ptr %local.alpha_ba.1663
  %t1785 = load i64, ptr %local.alpha_bc.1664
  %t1786 = load i64, ptr %local.alpha_ca.1665
  %t1787 = load i64, ptr %local.alpha_cb.1666
  %t1788 = load i64, ptr %local.inner_steps.1674
  %t1789 = call i64 @"exp1_meta_grad"(i64 %t1782, i64 %t1783, i64 %t1784, i64 %t1785, i64 %t1786, i64 %t1787, i64 5, i64 %t1788)
  store i64 %t1789, ptr %local.mg.1669
  %t1790 = load i64, ptr %local.alpha_cb.1666
  %t1791 = load i64, ptr %local.meta_lr.1673
  %t1792 = load i64, ptr %local.mg.1669
  %t1793 = call i64 @"sx_f64_mul"(i64 %t1791, i64 %t1792)
  %t1794 = call i64 @"sx_f64_sub"(i64 %t1790, i64 %t1793)
  %t1795 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.246)
  %t1796 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.247)
  %t1797 = call i64 @"clamp"(i64 %t1794, i64 %t1795, i64 %t1796)
  store i64 %t1797, ptr %local.alpha_cb.1666
  %t1798 = load i64, ptr %local.alpha_ab.1661
  %t1799 = load i64, ptr %local.prev_ab.1667
  %t1800 = call i64 @"sx_f64_sub"(i64 %t1798, i64 %t1799)
  %t1801 = call i64 @"abs_f64"(i64 %t1800)
  store i64 %t1801, ptr %local.drift.1670
  %t1802 = load i64, ptr %local.drift.1670
  %t1803 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.248)
  %t1804 = call i64 @"sx_f64_lt"(i64 %t1802, i64 %t1803)
  %t1805 = icmp ne i64 %t1804, 0
  br i1 %t1805, label %then46, label %else46
then46:
  %t1806 = load i64, ptr %local.recovered.1672
  %t1807 = icmp eq i64 %t1806, 0
  %t1808 = zext i1 %t1807 to i64
  %t1809 = icmp ne i64 %t1808, 0
  br i1 %t1809, label %then47, label %else47
then47:
  %t1810 = load i64, ptr %local.cycle.1668
  store i64 %t1810, ptr %local.recover_cycle.1671
  store i64 1, ptr %local.recovered.1672
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1811 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1812 = phi i64 [ %t1811, %then46_end ], [ 0, %else46_end ]
  %t1813 = load i64, ptr %local.cycle.1668
  %t1814 = add i64 %t1813, 1
  store i64 %t1814, ptr %local.cycle.1668
  br label %loop45
endloop45:
  %t1815 = load i64, ptr %local.alpha_ab.1661
  %t1816 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.249)
  %t1817 = call i64 @"sx_f64_sub"(i64 %t1815, i64 %t1816)
  %t1818 = call i64 @"abs_f64"(i64 %t1817)
  store i64 %t1818, ptr %local.final_dist.1677
  %t1819 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.250)
  %t1820 = ptrtoint ptr %t1819 to i64
  %t1821 = inttoptr i64 %t1820 to ptr
  call void @intrinsic_print(ptr %t1821)
  %t1822 = load i64, ptr %local.perturb_size
  %t1823 = call i64 @"print_f64"(i64 %t1822)
  %t1824 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.251)
  %t1825 = ptrtoint ptr %t1824 to i64
  %t1826 = inttoptr i64 %t1825 to ptr
  call void @intrinsic_print(ptr %t1826)
  %t1827 = load i64, ptr %local.initial_ab.1676
  %t1828 = call i64 @"print_f64"(i64 %t1827)
  %t1829 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.252)
  %t1830 = ptrtoint ptr %t1829 to i64
  %t1831 = inttoptr i64 %t1830 to ptr
  call void @intrinsic_print(ptr %t1831)
  %t1832 = load i64, ptr %local.alpha_ab.1661
  %t1833 = call i64 @"print_f64"(i64 %t1832)
  %t1834 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.253)
  %t1835 = ptrtoint ptr %t1834 to i64
  %t1836 = inttoptr i64 %t1835 to ptr
  call void @intrinsic_print(ptr %t1836)
  %t1837 = load i64, ptr %local.final_dist.1677
  %t1838 = call i64 @"print_f64"(i64 %t1837)
  %t1839 = load i64, ptr %local.recovered.1672
  %t1840 = icmp eq i64 %t1839, 1
  %t1841 = zext i1 %t1840 to i64
  %t1842 = icmp ne i64 %t1841, 0
  br i1 %t1842, label %then48, label %else48
then48:
  %t1843 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.254)
  %t1844 = ptrtoint ptr %t1843 to i64
  %t1845 = inttoptr i64 %t1844 to ptr
  call void @intrinsic_print(ptr %t1845)
  %t1846 = load i64, ptr %local.recover_cycle.1671
  call void @print_i64(i64 %t1846)
  br label %then48_end
then48_end:
  br label %endif48
else48:
  %t1847 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.255)
  %t1848 = ptrtoint ptr %t1847 to i64
  %t1849 = inttoptr i64 %t1848 to ptr
  call void @intrinsic_print(ptr %t1849)
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1850 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1851 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.256)
  %t1852 = ptrtoint ptr %t1851 to i64
  %t1853 = inttoptr i64 %t1852 to ptr
  call void @intrinsic_println(ptr %t1853)
  %t1854 = load i64, ptr %local.recovered.1672
  ret i64 %t1854
}

define i64 @"run_exp3"() nounwind {
entry:
  %local.all_recovered.1855 = alloca i64
  %local.r.1856 = alloca i64
  store i64 1, ptr %local.all_recovered.1855
  store i64 0, ptr %local.r.1856
  %t1857 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.257)
  %t1858 = ptrtoint ptr %t1857 to i64
  %t1859 = inttoptr i64 %t1858 to ptr
  call void @intrinsic_println(ptr %t1859)
  %t1860 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.258)
  %t1861 = ptrtoint ptr %t1860 to i64
  %t1862 = inttoptr i64 %t1861 to ptr
  call void @intrinsic_println(ptr %t1862)
  %t1863 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.259)
  %t1864 = ptrtoint ptr %t1863 to i64
  %t1865 = inttoptr i64 %t1864 to ptr
  call void @intrinsic_println(ptr %t1865)
  %t1866 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.260)
  %t1867 = ptrtoint ptr %t1866 to i64
  %t1868 = inttoptr i64 %t1867 to ptr
  call void @intrinsic_println(ptr %t1868)
  %t1869 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.261)
  %t1870 = ptrtoint ptr %t1869 to i64
  %t1871 = inttoptr i64 %t1870 to ptr
  call void @intrinsic_println(ptr %t1871)
  %t1872 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.262)
  %t1873 = ptrtoint ptr %t1872 to i64
  %t1874 = inttoptr i64 %t1873 to ptr
  call void @intrinsic_println(ptr %t1874)
  %t1875 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.263)
  %t1876 = call i64 @"exp3_test_perturbation"(i64 %t1875)
  store i64 %t1876, ptr %local.r.1856
  %t1877 = load i64, ptr %local.r.1856
  %t1878 = icmp eq i64 %t1877, 0
  %t1879 = zext i1 %t1878 to i64
  %t1880 = icmp ne i64 %t1879, 0
  br i1 %t1880, label %then49, label %else49
then49:
  store i64 0, ptr %local.all_recovered.1855
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1881 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t1882 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.264)
  %t1883 = call i64 @"exp3_test_perturbation"(i64 %t1882)
  store i64 %t1883, ptr %local.r.1856
  %t1884 = load i64, ptr %local.r.1856
  %t1885 = icmp eq i64 %t1884, 0
  %t1886 = zext i1 %t1885 to i64
  %t1887 = icmp ne i64 %t1886, 0
  br i1 %t1887, label %then50, label %else50
then50:
  store i64 0, ptr %local.all_recovered.1855
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1888 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t1889 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.265)
  %t1890 = call i64 @"exp3_test_perturbation"(i64 %t1889)
  store i64 %t1890, ptr %local.r.1856
  %t1891 = load i64, ptr %local.r.1856
  %t1892 = icmp eq i64 %t1891, 0
  %t1893 = zext i1 %t1892 to i64
  %t1894 = icmp ne i64 %t1893, 0
  br i1 %t1894, label %then51, label %else51
then51:
  store i64 0, ptr %local.all_recovered.1855
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t1895 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t1896 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.266)
  %t1897 = call i64 @"exp3_test_perturbation"(i64 %t1896)
  store i64 %t1897, ptr %local.r.1856
  %t1898 = load i64, ptr %local.r.1856
  %t1899 = icmp eq i64 %t1898, 0
  %t1900 = zext i1 %t1899 to i64
  %t1901 = icmp ne i64 %t1900, 0
  br i1 %t1901, label %then52, label %else52
then52:
  store i64 0, ptr %local.all_recovered.1855
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t1902 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t1903 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.267)
  %t1904 = ptrtoint ptr %t1903 to i64
  %t1905 = inttoptr i64 %t1904 to ptr
  call void @intrinsic_println(ptr %t1905)
  %t1906 = load i64, ptr %local.all_recovered.1855
  %t1907 = icmp eq i64 %t1906, 1
  %t1908 = zext i1 %t1907 to i64
  %t1909 = icmp ne i64 %t1908, 0
  br i1 %t1909, label %then53, label %else53
then53:
  %t1910 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.268)
  %t1911 = ptrtoint ptr %t1910 to i64
  %t1912 = inttoptr i64 %t1911 to ptr
  call void @intrinsic_println(ptr %t1912)
  %t1913 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.269)
  %t1914 = ptrtoint ptr %t1913 to i64
  %t1915 = inttoptr i64 %t1914 to ptr
  call void @intrinsic_println(ptr %t1915)
  br label %then53_end
then53_end:
  br label %endif53
else53:
  %t1916 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.270)
  %t1917 = ptrtoint ptr %t1916 to i64
  %t1918 = inttoptr i64 %t1917 to ptr
  call void @intrinsic_println(ptr %t1918)
  %t1919 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.271)
  %t1920 = ptrtoint ptr %t1919 to i64
  %t1921 = inttoptr i64 %t1920 to ptr
  call void @intrinsic_println(ptr %t1921)
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t1922 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t1923 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.272)
  %t1924 = ptrtoint ptr %t1923 to i64
  %t1925 = inttoptr i64 %t1924 to ptr
  call void @intrinsic_println(ptr %t1925)
  ret i64 0
}

define i64 @"exp4_run_cycle"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %steps) nounwind {
entry:
  %local.w0.1926 = alloca i64
  %local.w1.1927 = alloca i64
  %local.w2.1928 = alloca i64
  %local.w3.1929 = alloca i64
  %local.step.1930 = alloca i64
  %local.g0_0.1931 = alloca i64
  %local.g0_1.1932 = alloca i64
  %local.g0_2.1933 = alloca i64
  %local.g0_3.1934 = alloca i64
  %local.g1_0.1935 = alloca i64
  %local.g1_1.1936 = alloca i64
  %local.g1_2.1937 = alloca i64
  %local.g1_3.1938 = alloca i64
  %local.g2_0.1939 = alloca i64
  %local.g2_1.1940 = alloca i64
  %local.g2_2.1941 = alloca i64
  %local.g2_3.1942 = alloca i64
  %local.g3_0.1943 = alloca i64
  %local.g3_1.1944 = alloca i64
  %local.g3_2.1945 = alloca i64
  %local.g3_3.1946 = alloca i64
  %local.r0_0.1947 = alloca i64
  %local.r0_1.1948 = alloca i64
  %local.r0_2.1949 = alloca i64
  %local.r0_3.1950 = alloca i64
  %local.r1_0.1951 = alloca i64
  %local.r1_1.1952 = alloca i64
  %local.r1_2.1953 = alloca i64
  %local.r1_3.1954 = alloca i64
  %local.r2_0.1955 = alloca i64
  %local.r2_1.1956 = alloca i64
  %local.r2_2.1957 = alloca i64
  %local.r2_3.1958 = alloca i64
  %local.r3_0.1959 = alloca i64
  %local.r3_1.1960 = alloca i64
  %local.r3_2.1961 = alloca i64
  %local.r3_3.1962 = alloca i64
  %local.lr.1963 = alloca i64
  %local.l0.1964 = alloca i64
  %local.l1.1965 = alloca i64
  %local.l2.1966 = alloca i64
  %local.l3.1967 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1968 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.273)
  store i64 %t1968, ptr %local.w0.1926
  %t1969 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.274)
  store i64 %t1969, ptr %local.w1.1927
  %t1970 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.275)
  store i64 %t1970, ptr %local.w2.1928
  %t1971 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.276)
  store i64 %t1971, ptr %local.w3.1929
  store i64 0, ptr %local.step.1930
  %t1972 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.277)
  store i64 %t1972, ptr %local.g0_0.1931
  %t1973 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.278)
  store i64 %t1973, ptr %local.g0_1.1932
  %t1974 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.279)
  store i64 %t1974, ptr %local.g0_2.1933
  %t1975 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.280)
  store i64 %t1975, ptr %local.g0_3.1934
  %t1976 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.281)
  store i64 %t1976, ptr %local.g1_0.1935
  %t1977 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.282)
  store i64 %t1977, ptr %local.g1_1.1936
  %t1978 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.283)
  store i64 %t1978, ptr %local.g1_2.1937
  %t1979 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.284)
  store i64 %t1979, ptr %local.g1_3.1938
  %t1980 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.285)
  store i64 %t1980, ptr %local.g2_0.1939
  %t1981 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.286)
  store i64 %t1981, ptr %local.g2_1.1940
  %t1982 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.287)
  store i64 %t1982, ptr %local.g2_2.1941
  %t1983 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.288)
  store i64 %t1983, ptr %local.g2_3.1942
  %t1984 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.289)
  store i64 %t1984, ptr %local.g3_0.1943
  %t1985 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.290)
  store i64 %t1985, ptr %local.g3_1.1944
  %t1986 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.291)
  store i64 %t1986, ptr %local.g3_2.1945
  %t1987 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.292)
  store i64 %t1987, ptr %local.g3_3.1946
  %t1988 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.293)
  store i64 %t1988, ptr %local.r0_0.1947
  %t1989 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.294)
  store i64 %t1989, ptr %local.r0_1.1948
  %t1990 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.295)
  store i64 %t1990, ptr %local.r0_2.1949
  %t1991 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.296)
  store i64 %t1991, ptr %local.r0_3.1950
  %t1992 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.297)
  store i64 %t1992, ptr %local.r1_0.1951
  %t1993 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.298)
  store i64 %t1993, ptr %local.r1_1.1952
  %t1994 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.299)
  store i64 %t1994, ptr %local.r1_2.1953
  %t1995 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.300)
  store i64 %t1995, ptr %local.r1_3.1954
  %t1996 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.301)
  store i64 %t1996, ptr %local.r2_0.1955
  %t1997 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.302)
  store i64 %t1997, ptr %local.r2_1.1956
  %t1998 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.303)
  store i64 %t1998, ptr %local.r2_2.1957
  %t1999 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.304)
  store i64 %t1999, ptr %local.r2_3.1958
  %t2000 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.305)
  store i64 %t2000, ptr %local.r3_0.1959
  %t2001 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.306)
  store i64 %t2001, ptr %local.r3_1.1960
  %t2002 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.307)
  store i64 %t2002, ptr %local.r3_2.1961
  %t2003 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.308)
  store i64 %t2003, ptr %local.r3_3.1962
  %t2004 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.309)
  store i64 %t2004, ptr %local.lr.1963
  br label %loop54
loop54:
  %t2005 = load i64, ptr %local.step.1930
  %t2006 = load i64, ptr %local.steps
  %t2007 = icmp slt i64 %t2005, %t2006
  %t2008 = zext i1 %t2007 to i64
  %t2009 = icmp ne i64 %t2008, 0
  br i1 %t2009, label %body54, label %endloop54
body54:
  %t2010 = load i64, ptr %local.w0.1926
  %t2011 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.310)
  %t2012 = call i64 @"grad4"(i64 %t2010, i64 %t2011)
  store i64 %t2012, ptr %local.g0_0.1931
  %t2013 = load i64, ptr %local.w1.1927
  %t2014 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.311)
  %t2015 = call i64 @"grad4"(i64 %t2013, i64 %t2014)
  store i64 %t2015, ptr %local.g0_1.1932
  %t2016 = load i64, ptr %local.w2.1928
  %t2017 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.312)
  %t2018 = call i64 @"grad4"(i64 %t2016, i64 %t2017)
  store i64 %t2018, ptr %local.g0_2.1933
  %t2019 = load i64, ptr %local.w3.1929
  %t2020 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.313)
  %t2021 = call i64 @"grad4"(i64 %t2019, i64 %t2020)
  store i64 %t2021, ptr %local.g0_3.1934
  %t2022 = load i64, ptr %local.w0.1926
  %t2023 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.314)
  %t2024 = call i64 @"grad4"(i64 %t2022, i64 %t2023)
  store i64 %t2024, ptr %local.g1_0.1935
  %t2025 = load i64, ptr %local.w1.1927
  %t2026 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.315)
  %t2027 = call i64 @"grad4"(i64 %t2025, i64 %t2026)
  store i64 %t2027, ptr %local.g1_1.1936
  %t2028 = load i64, ptr %local.w2.1928
  %t2029 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.316)
  %t2030 = call i64 @"grad4"(i64 %t2028, i64 %t2029)
  store i64 %t2030, ptr %local.g1_2.1937
  %t2031 = load i64, ptr %local.w3.1929
  %t2032 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.317)
  %t2033 = call i64 @"grad4"(i64 %t2031, i64 %t2032)
  store i64 %t2033, ptr %local.g1_3.1938
  %t2034 = load i64, ptr %local.w0.1926
  %t2035 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.318)
  %t2036 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.319)
  %t2037 = call i64 @"sx_f64_sub"(i64 %t2035, i64 %t2036)
  %t2038 = call i64 @"grad4"(i64 %t2034, i64 %t2037)
  store i64 %t2038, ptr %local.g2_0.1939
  %t2039 = load i64, ptr %local.w1.1927
  %t2040 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.320)
  %t2041 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.321)
  %t2042 = call i64 @"sx_f64_sub"(i64 %t2040, i64 %t2041)
  %t2043 = call i64 @"grad4"(i64 %t2039, i64 %t2042)
  store i64 %t2043, ptr %local.g2_1.1940
  %t2044 = load i64, ptr %local.w2.1928
  %t2045 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.322)
  %t2046 = call i64 @"grad4"(i64 %t2044, i64 %t2045)
  store i64 %t2046, ptr %local.g2_2.1941
  %t2047 = load i64, ptr %local.w3.1929
  %t2048 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.323)
  %t2049 = call i64 @"grad4"(i64 %t2047, i64 %t2048)
  store i64 %t2049, ptr %local.g2_3.1942
  %t2050 = load i64, ptr %local.w0.1926
  %t2051 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.324)
  %t2052 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.325)
  %t2053 = call i64 @"sx_f64_sub"(i64 %t2051, i64 %t2052)
  %t2054 = call i64 @"grad4"(i64 %t2050, i64 %t2053)
  store i64 %t2054, ptr %local.g3_0.1943
  %t2055 = load i64, ptr %local.w1.1927
  %t2056 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.326)
  %t2057 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.327)
  %t2058 = call i64 @"sx_f64_sub"(i64 %t2056, i64 %t2057)
  %t2059 = call i64 @"grad4"(i64 %t2055, i64 %t2058)
  store i64 %t2059, ptr %local.g3_1.1944
  %t2060 = load i64, ptr %local.w2.1928
  %t2061 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.328)
  %t2062 = call i64 @"grad4"(i64 %t2060, i64 %t2061)
  store i64 %t2062, ptr %local.g3_2.1945
  %t2063 = load i64, ptr %local.w3.1929
  %t2064 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.329)
  %t2065 = call i64 @"grad4"(i64 %t2063, i64 %t2064)
  store i64 %t2065, ptr %local.g3_3.1946
  %t2066 = load i64, ptr %local.g0_0.1931
  %t2067 = load i64, ptr %local.g1_0.1935
  %t2068 = load i64, ptr %local.g1_1.1936
  %t2069 = load i64, ptr %local.g1_2.1937
  %t2070 = load i64, ptr %local.g1_3.1938
  %t2071 = load i64, ptr %local.g0_0.1931
  %t2072 = load i64, ptr %local.g0_1.1932
  %t2073 = load i64, ptr %local.g0_2.1933
  %t2074 = load i64, ptr %local.g0_3.1934
  %t2075 = load i64, ptr %local.a01
  %t2076 = call i64 @"project_dim"(i64 %t2066, i64 %t2067, i64 %t2068, i64 %t2069, i64 %t2070, i64 %t2071, i64 %t2072, i64 %t2073, i64 %t2074, i64 %t2075, i64 0)
  store i64 %t2076, ptr %local.r0_0.1947
  %t2077 = load i64, ptr %local.r0_0.1947
  %t2078 = load i64, ptr %local.g2_0.1939
  %t2079 = load i64, ptr %local.g2_1.1940
  %t2080 = load i64, ptr %local.g2_2.1941
  %t2081 = load i64, ptr %local.g2_3.1942
  %t2082 = load i64, ptr %local.g0_0.1931
  %t2083 = load i64, ptr %local.g0_1.1932
  %t2084 = load i64, ptr %local.g0_2.1933
  %t2085 = load i64, ptr %local.g0_3.1934
  %t2086 = load i64, ptr %local.a02
  %t2087 = call i64 @"project_dim"(i64 %t2077, i64 %t2078, i64 %t2079, i64 %t2080, i64 %t2081, i64 %t2082, i64 %t2083, i64 %t2084, i64 %t2085, i64 %t2086, i64 0)
  store i64 %t2087, ptr %local.r0_0.1947
  %t2088 = load i64, ptr %local.r0_0.1947
  %t2089 = load i64, ptr %local.g3_0.1943
  %t2090 = load i64, ptr %local.g3_1.1944
  %t2091 = load i64, ptr %local.g3_2.1945
  %t2092 = load i64, ptr %local.g3_3.1946
  %t2093 = load i64, ptr %local.g0_0.1931
  %t2094 = load i64, ptr %local.g0_1.1932
  %t2095 = load i64, ptr %local.g0_2.1933
  %t2096 = load i64, ptr %local.g0_3.1934
  %t2097 = load i64, ptr %local.a03
  %t2098 = call i64 @"project_dim"(i64 %t2088, i64 %t2089, i64 %t2090, i64 %t2091, i64 %t2092, i64 %t2093, i64 %t2094, i64 %t2095, i64 %t2096, i64 %t2097, i64 0)
  store i64 %t2098, ptr %local.r0_0.1947
  %t2099 = load i64, ptr %local.g0_1.1932
  %t2100 = load i64, ptr %local.g1_0.1935
  %t2101 = load i64, ptr %local.g1_1.1936
  %t2102 = load i64, ptr %local.g1_2.1937
  %t2103 = load i64, ptr %local.g1_3.1938
  %t2104 = load i64, ptr %local.g0_0.1931
  %t2105 = load i64, ptr %local.g0_1.1932
  %t2106 = load i64, ptr %local.g0_2.1933
  %t2107 = load i64, ptr %local.g0_3.1934
  %t2108 = load i64, ptr %local.a01
  %t2109 = call i64 @"project_dim"(i64 %t2099, i64 %t2100, i64 %t2101, i64 %t2102, i64 %t2103, i64 %t2104, i64 %t2105, i64 %t2106, i64 %t2107, i64 %t2108, i64 1)
  store i64 %t2109, ptr %local.r0_1.1948
  %t2110 = load i64, ptr %local.r0_1.1948
  %t2111 = load i64, ptr %local.g2_0.1939
  %t2112 = load i64, ptr %local.g2_1.1940
  %t2113 = load i64, ptr %local.g2_2.1941
  %t2114 = load i64, ptr %local.g2_3.1942
  %t2115 = load i64, ptr %local.g0_0.1931
  %t2116 = load i64, ptr %local.g0_1.1932
  %t2117 = load i64, ptr %local.g0_2.1933
  %t2118 = load i64, ptr %local.g0_3.1934
  %t2119 = load i64, ptr %local.a02
  %t2120 = call i64 @"project_dim"(i64 %t2110, i64 %t2111, i64 %t2112, i64 %t2113, i64 %t2114, i64 %t2115, i64 %t2116, i64 %t2117, i64 %t2118, i64 %t2119, i64 1)
  store i64 %t2120, ptr %local.r0_1.1948
  %t2121 = load i64, ptr %local.r0_1.1948
  %t2122 = load i64, ptr %local.g3_0.1943
  %t2123 = load i64, ptr %local.g3_1.1944
  %t2124 = load i64, ptr %local.g3_2.1945
  %t2125 = load i64, ptr %local.g3_3.1946
  %t2126 = load i64, ptr %local.g0_0.1931
  %t2127 = load i64, ptr %local.g0_1.1932
  %t2128 = load i64, ptr %local.g0_2.1933
  %t2129 = load i64, ptr %local.g0_3.1934
  %t2130 = load i64, ptr %local.a03
  %t2131 = call i64 @"project_dim"(i64 %t2121, i64 %t2122, i64 %t2123, i64 %t2124, i64 %t2125, i64 %t2126, i64 %t2127, i64 %t2128, i64 %t2129, i64 %t2130, i64 1)
  store i64 %t2131, ptr %local.r0_1.1948
  %t2132 = load i64, ptr %local.g0_2.1933
  %t2133 = load i64, ptr %local.g1_0.1935
  %t2134 = load i64, ptr %local.g1_1.1936
  %t2135 = load i64, ptr %local.g1_2.1937
  %t2136 = load i64, ptr %local.g1_3.1938
  %t2137 = load i64, ptr %local.g0_0.1931
  %t2138 = load i64, ptr %local.g0_1.1932
  %t2139 = load i64, ptr %local.g0_2.1933
  %t2140 = load i64, ptr %local.g0_3.1934
  %t2141 = load i64, ptr %local.a01
  %t2142 = call i64 @"project_dim"(i64 %t2132, i64 %t2133, i64 %t2134, i64 %t2135, i64 %t2136, i64 %t2137, i64 %t2138, i64 %t2139, i64 %t2140, i64 %t2141, i64 2)
  store i64 %t2142, ptr %local.r0_2.1949
  %t2143 = load i64, ptr %local.r0_2.1949
  %t2144 = load i64, ptr %local.g2_0.1939
  %t2145 = load i64, ptr %local.g2_1.1940
  %t2146 = load i64, ptr %local.g2_2.1941
  %t2147 = load i64, ptr %local.g2_3.1942
  %t2148 = load i64, ptr %local.g0_0.1931
  %t2149 = load i64, ptr %local.g0_1.1932
  %t2150 = load i64, ptr %local.g0_2.1933
  %t2151 = load i64, ptr %local.g0_3.1934
  %t2152 = load i64, ptr %local.a02
  %t2153 = call i64 @"project_dim"(i64 %t2143, i64 %t2144, i64 %t2145, i64 %t2146, i64 %t2147, i64 %t2148, i64 %t2149, i64 %t2150, i64 %t2151, i64 %t2152, i64 2)
  store i64 %t2153, ptr %local.r0_2.1949
  %t2154 = load i64, ptr %local.r0_2.1949
  %t2155 = load i64, ptr %local.g3_0.1943
  %t2156 = load i64, ptr %local.g3_1.1944
  %t2157 = load i64, ptr %local.g3_2.1945
  %t2158 = load i64, ptr %local.g3_3.1946
  %t2159 = load i64, ptr %local.g0_0.1931
  %t2160 = load i64, ptr %local.g0_1.1932
  %t2161 = load i64, ptr %local.g0_2.1933
  %t2162 = load i64, ptr %local.g0_3.1934
  %t2163 = load i64, ptr %local.a03
  %t2164 = call i64 @"project_dim"(i64 %t2154, i64 %t2155, i64 %t2156, i64 %t2157, i64 %t2158, i64 %t2159, i64 %t2160, i64 %t2161, i64 %t2162, i64 %t2163, i64 2)
  store i64 %t2164, ptr %local.r0_2.1949
  %t2165 = load i64, ptr %local.g0_3.1934
  %t2166 = load i64, ptr %local.g1_0.1935
  %t2167 = load i64, ptr %local.g1_1.1936
  %t2168 = load i64, ptr %local.g1_2.1937
  %t2169 = load i64, ptr %local.g1_3.1938
  %t2170 = load i64, ptr %local.g0_0.1931
  %t2171 = load i64, ptr %local.g0_1.1932
  %t2172 = load i64, ptr %local.g0_2.1933
  %t2173 = load i64, ptr %local.g0_3.1934
  %t2174 = load i64, ptr %local.a01
  %t2175 = call i64 @"project_dim"(i64 %t2165, i64 %t2166, i64 %t2167, i64 %t2168, i64 %t2169, i64 %t2170, i64 %t2171, i64 %t2172, i64 %t2173, i64 %t2174, i64 3)
  store i64 %t2175, ptr %local.r0_3.1950
  %t2176 = load i64, ptr %local.r0_3.1950
  %t2177 = load i64, ptr %local.g2_0.1939
  %t2178 = load i64, ptr %local.g2_1.1940
  %t2179 = load i64, ptr %local.g2_2.1941
  %t2180 = load i64, ptr %local.g2_3.1942
  %t2181 = load i64, ptr %local.g0_0.1931
  %t2182 = load i64, ptr %local.g0_1.1932
  %t2183 = load i64, ptr %local.g0_2.1933
  %t2184 = load i64, ptr %local.g0_3.1934
  %t2185 = load i64, ptr %local.a02
  %t2186 = call i64 @"project_dim"(i64 %t2176, i64 %t2177, i64 %t2178, i64 %t2179, i64 %t2180, i64 %t2181, i64 %t2182, i64 %t2183, i64 %t2184, i64 %t2185, i64 3)
  store i64 %t2186, ptr %local.r0_3.1950
  %t2187 = load i64, ptr %local.r0_3.1950
  %t2188 = load i64, ptr %local.g3_0.1943
  %t2189 = load i64, ptr %local.g3_1.1944
  %t2190 = load i64, ptr %local.g3_2.1945
  %t2191 = load i64, ptr %local.g3_3.1946
  %t2192 = load i64, ptr %local.g0_0.1931
  %t2193 = load i64, ptr %local.g0_1.1932
  %t2194 = load i64, ptr %local.g0_2.1933
  %t2195 = load i64, ptr %local.g0_3.1934
  %t2196 = load i64, ptr %local.a03
  %t2197 = call i64 @"project_dim"(i64 %t2187, i64 %t2188, i64 %t2189, i64 %t2190, i64 %t2191, i64 %t2192, i64 %t2193, i64 %t2194, i64 %t2195, i64 %t2196, i64 3)
  store i64 %t2197, ptr %local.r0_3.1950
  %t2198 = load i64, ptr %local.g1_0.1935
  %t2199 = load i64, ptr %local.g0_0.1931
  %t2200 = load i64, ptr %local.g0_1.1932
  %t2201 = load i64, ptr %local.g0_2.1933
  %t2202 = load i64, ptr %local.g0_3.1934
  %t2203 = load i64, ptr %local.g1_0.1935
  %t2204 = load i64, ptr %local.g1_1.1936
  %t2205 = load i64, ptr %local.g1_2.1937
  %t2206 = load i64, ptr %local.g1_3.1938
  %t2207 = load i64, ptr %local.a10
  %t2208 = call i64 @"project_dim"(i64 %t2198, i64 %t2199, i64 %t2200, i64 %t2201, i64 %t2202, i64 %t2203, i64 %t2204, i64 %t2205, i64 %t2206, i64 %t2207, i64 0)
  store i64 %t2208, ptr %local.r1_0.1951
  %t2209 = load i64, ptr %local.r1_0.1951
  %t2210 = load i64, ptr %local.g2_0.1939
  %t2211 = load i64, ptr %local.g2_1.1940
  %t2212 = load i64, ptr %local.g2_2.1941
  %t2213 = load i64, ptr %local.g2_3.1942
  %t2214 = load i64, ptr %local.g1_0.1935
  %t2215 = load i64, ptr %local.g1_1.1936
  %t2216 = load i64, ptr %local.g1_2.1937
  %t2217 = load i64, ptr %local.g1_3.1938
  %t2218 = load i64, ptr %local.a12
  %t2219 = call i64 @"project_dim"(i64 %t2209, i64 %t2210, i64 %t2211, i64 %t2212, i64 %t2213, i64 %t2214, i64 %t2215, i64 %t2216, i64 %t2217, i64 %t2218, i64 0)
  store i64 %t2219, ptr %local.r1_0.1951
  %t2220 = load i64, ptr %local.r1_0.1951
  %t2221 = load i64, ptr %local.g3_0.1943
  %t2222 = load i64, ptr %local.g3_1.1944
  %t2223 = load i64, ptr %local.g3_2.1945
  %t2224 = load i64, ptr %local.g3_3.1946
  %t2225 = load i64, ptr %local.g1_0.1935
  %t2226 = load i64, ptr %local.g1_1.1936
  %t2227 = load i64, ptr %local.g1_2.1937
  %t2228 = load i64, ptr %local.g1_3.1938
  %t2229 = load i64, ptr %local.a13
  %t2230 = call i64 @"project_dim"(i64 %t2220, i64 %t2221, i64 %t2222, i64 %t2223, i64 %t2224, i64 %t2225, i64 %t2226, i64 %t2227, i64 %t2228, i64 %t2229, i64 0)
  store i64 %t2230, ptr %local.r1_0.1951
  %t2231 = load i64, ptr %local.g1_1.1936
  %t2232 = load i64, ptr %local.g0_0.1931
  %t2233 = load i64, ptr %local.g0_1.1932
  %t2234 = load i64, ptr %local.g0_2.1933
  %t2235 = load i64, ptr %local.g0_3.1934
  %t2236 = load i64, ptr %local.g1_0.1935
  %t2237 = load i64, ptr %local.g1_1.1936
  %t2238 = load i64, ptr %local.g1_2.1937
  %t2239 = load i64, ptr %local.g1_3.1938
  %t2240 = load i64, ptr %local.a10
  %t2241 = call i64 @"project_dim"(i64 %t2231, i64 %t2232, i64 %t2233, i64 %t2234, i64 %t2235, i64 %t2236, i64 %t2237, i64 %t2238, i64 %t2239, i64 %t2240, i64 1)
  store i64 %t2241, ptr %local.r1_1.1952
  %t2242 = load i64, ptr %local.r1_1.1952
  %t2243 = load i64, ptr %local.g2_0.1939
  %t2244 = load i64, ptr %local.g2_1.1940
  %t2245 = load i64, ptr %local.g2_2.1941
  %t2246 = load i64, ptr %local.g2_3.1942
  %t2247 = load i64, ptr %local.g1_0.1935
  %t2248 = load i64, ptr %local.g1_1.1936
  %t2249 = load i64, ptr %local.g1_2.1937
  %t2250 = load i64, ptr %local.g1_3.1938
  %t2251 = load i64, ptr %local.a12
  %t2252 = call i64 @"project_dim"(i64 %t2242, i64 %t2243, i64 %t2244, i64 %t2245, i64 %t2246, i64 %t2247, i64 %t2248, i64 %t2249, i64 %t2250, i64 %t2251, i64 1)
  store i64 %t2252, ptr %local.r1_1.1952
  %t2253 = load i64, ptr %local.r1_1.1952
  %t2254 = load i64, ptr %local.g3_0.1943
  %t2255 = load i64, ptr %local.g3_1.1944
  %t2256 = load i64, ptr %local.g3_2.1945
  %t2257 = load i64, ptr %local.g3_3.1946
  %t2258 = load i64, ptr %local.g1_0.1935
  %t2259 = load i64, ptr %local.g1_1.1936
  %t2260 = load i64, ptr %local.g1_2.1937
  %t2261 = load i64, ptr %local.g1_3.1938
  %t2262 = load i64, ptr %local.a13
  %t2263 = call i64 @"project_dim"(i64 %t2253, i64 %t2254, i64 %t2255, i64 %t2256, i64 %t2257, i64 %t2258, i64 %t2259, i64 %t2260, i64 %t2261, i64 %t2262, i64 1)
  store i64 %t2263, ptr %local.r1_1.1952
  %t2264 = load i64, ptr %local.g1_2.1937
  %t2265 = load i64, ptr %local.g0_0.1931
  %t2266 = load i64, ptr %local.g0_1.1932
  %t2267 = load i64, ptr %local.g0_2.1933
  %t2268 = load i64, ptr %local.g0_3.1934
  %t2269 = load i64, ptr %local.g1_0.1935
  %t2270 = load i64, ptr %local.g1_1.1936
  %t2271 = load i64, ptr %local.g1_2.1937
  %t2272 = load i64, ptr %local.g1_3.1938
  %t2273 = load i64, ptr %local.a10
  %t2274 = call i64 @"project_dim"(i64 %t2264, i64 %t2265, i64 %t2266, i64 %t2267, i64 %t2268, i64 %t2269, i64 %t2270, i64 %t2271, i64 %t2272, i64 %t2273, i64 2)
  store i64 %t2274, ptr %local.r1_2.1953
  %t2275 = load i64, ptr %local.r1_2.1953
  %t2276 = load i64, ptr %local.g2_0.1939
  %t2277 = load i64, ptr %local.g2_1.1940
  %t2278 = load i64, ptr %local.g2_2.1941
  %t2279 = load i64, ptr %local.g2_3.1942
  %t2280 = load i64, ptr %local.g1_0.1935
  %t2281 = load i64, ptr %local.g1_1.1936
  %t2282 = load i64, ptr %local.g1_2.1937
  %t2283 = load i64, ptr %local.g1_3.1938
  %t2284 = load i64, ptr %local.a12
  %t2285 = call i64 @"project_dim"(i64 %t2275, i64 %t2276, i64 %t2277, i64 %t2278, i64 %t2279, i64 %t2280, i64 %t2281, i64 %t2282, i64 %t2283, i64 %t2284, i64 2)
  store i64 %t2285, ptr %local.r1_2.1953
  %t2286 = load i64, ptr %local.r1_2.1953
  %t2287 = load i64, ptr %local.g3_0.1943
  %t2288 = load i64, ptr %local.g3_1.1944
  %t2289 = load i64, ptr %local.g3_2.1945
  %t2290 = load i64, ptr %local.g3_3.1946
  %t2291 = load i64, ptr %local.g1_0.1935
  %t2292 = load i64, ptr %local.g1_1.1936
  %t2293 = load i64, ptr %local.g1_2.1937
  %t2294 = load i64, ptr %local.g1_3.1938
  %t2295 = load i64, ptr %local.a13
  %t2296 = call i64 @"project_dim"(i64 %t2286, i64 %t2287, i64 %t2288, i64 %t2289, i64 %t2290, i64 %t2291, i64 %t2292, i64 %t2293, i64 %t2294, i64 %t2295, i64 2)
  store i64 %t2296, ptr %local.r1_2.1953
  %t2297 = load i64, ptr %local.g1_3.1938
  %t2298 = load i64, ptr %local.g0_0.1931
  %t2299 = load i64, ptr %local.g0_1.1932
  %t2300 = load i64, ptr %local.g0_2.1933
  %t2301 = load i64, ptr %local.g0_3.1934
  %t2302 = load i64, ptr %local.g1_0.1935
  %t2303 = load i64, ptr %local.g1_1.1936
  %t2304 = load i64, ptr %local.g1_2.1937
  %t2305 = load i64, ptr %local.g1_3.1938
  %t2306 = load i64, ptr %local.a10
  %t2307 = call i64 @"project_dim"(i64 %t2297, i64 %t2298, i64 %t2299, i64 %t2300, i64 %t2301, i64 %t2302, i64 %t2303, i64 %t2304, i64 %t2305, i64 %t2306, i64 3)
  store i64 %t2307, ptr %local.r1_3.1954
  %t2308 = load i64, ptr %local.r1_3.1954
  %t2309 = load i64, ptr %local.g2_0.1939
  %t2310 = load i64, ptr %local.g2_1.1940
  %t2311 = load i64, ptr %local.g2_2.1941
  %t2312 = load i64, ptr %local.g2_3.1942
  %t2313 = load i64, ptr %local.g1_0.1935
  %t2314 = load i64, ptr %local.g1_1.1936
  %t2315 = load i64, ptr %local.g1_2.1937
  %t2316 = load i64, ptr %local.g1_3.1938
  %t2317 = load i64, ptr %local.a12
  %t2318 = call i64 @"project_dim"(i64 %t2308, i64 %t2309, i64 %t2310, i64 %t2311, i64 %t2312, i64 %t2313, i64 %t2314, i64 %t2315, i64 %t2316, i64 %t2317, i64 3)
  store i64 %t2318, ptr %local.r1_3.1954
  %t2319 = load i64, ptr %local.r1_3.1954
  %t2320 = load i64, ptr %local.g3_0.1943
  %t2321 = load i64, ptr %local.g3_1.1944
  %t2322 = load i64, ptr %local.g3_2.1945
  %t2323 = load i64, ptr %local.g3_3.1946
  %t2324 = load i64, ptr %local.g1_0.1935
  %t2325 = load i64, ptr %local.g1_1.1936
  %t2326 = load i64, ptr %local.g1_2.1937
  %t2327 = load i64, ptr %local.g1_3.1938
  %t2328 = load i64, ptr %local.a13
  %t2329 = call i64 @"project_dim"(i64 %t2319, i64 %t2320, i64 %t2321, i64 %t2322, i64 %t2323, i64 %t2324, i64 %t2325, i64 %t2326, i64 %t2327, i64 %t2328, i64 3)
  store i64 %t2329, ptr %local.r1_3.1954
  %t2330 = load i64, ptr %local.g2_0.1939
  %t2331 = load i64, ptr %local.g0_0.1931
  %t2332 = load i64, ptr %local.g0_1.1932
  %t2333 = load i64, ptr %local.g0_2.1933
  %t2334 = load i64, ptr %local.g0_3.1934
  %t2335 = load i64, ptr %local.g2_0.1939
  %t2336 = load i64, ptr %local.g2_1.1940
  %t2337 = load i64, ptr %local.g2_2.1941
  %t2338 = load i64, ptr %local.g2_3.1942
  %t2339 = load i64, ptr %local.a20
  %t2340 = call i64 @"project_dim"(i64 %t2330, i64 %t2331, i64 %t2332, i64 %t2333, i64 %t2334, i64 %t2335, i64 %t2336, i64 %t2337, i64 %t2338, i64 %t2339, i64 0)
  store i64 %t2340, ptr %local.r2_0.1955
  %t2341 = load i64, ptr %local.r2_0.1955
  %t2342 = load i64, ptr %local.g1_0.1935
  %t2343 = load i64, ptr %local.g1_1.1936
  %t2344 = load i64, ptr %local.g1_2.1937
  %t2345 = load i64, ptr %local.g1_3.1938
  %t2346 = load i64, ptr %local.g2_0.1939
  %t2347 = load i64, ptr %local.g2_1.1940
  %t2348 = load i64, ptr %local.g2_2.1941
  %t2349 = load i64, ptr %local.g2_3.1942
  %t2350 = load i64, ptr %local.a21
  %t2351 = call i64 @"project_dim"(i64 %t2341, i64 %t2342, i64 %t2343, i64 %t2344, i64 %t2345, i64 %t2346, i64 %t2347, i64 %t2348, i64 %t2349, i64 %t2350, i64 0)
  store i64 %t2351, ptr %local.r2_0.1955
  %t2352 = load i64, ptr %local.r2_0.1955
  %t2353 = load i64, ptr %local.g3_0.1943
  %t2354 = load i64, ptr %local.g3_1.1944
  %t2355 = load i64, ptr %local.g3_2.1945
  %t2356 = load i64, ptr %local.g3_3.1946
  %t2357 = load i64, ptr %local.g2_0.1939
  %t2358 = load i64, ptr %local.g2_1.1940
  %t2359 = load i64, ptr %local.g2_2.1941
  %t2360 = load i64, ptr %local.g2_3.1942
  %t2361 = load i64, ptr %local.a23
  %t2362 = call i64 @"project_dim"(i64 %t2352, i64 %t2353, i64 %t2354, i64 %t2355, i64 %t2356, i64 %t2357, i64 %t2358, i64 %t2359, i64 %t2360, i64 %t2361, i64 0)
  store i64 %t2362, ptr %local.r2_0.1955
  %t2363 = load i64, ptr %local.g2_1.1940
  %t2364 = load i64, ptr %local.g0_0.1931
  %t2365 = load i64, ptr %local.g0_1.1932
  %t2366 = load i64, ptr %local.g0_2.1933
  %t2367 = load i64, ptr %local.g0_3.1934
  %t2368 = load i64, ptr %local.g2_0.1939
  %t2369 = load i64, ptr %local.g2_1.1940
  %t2370 = load i64, ptr %local.g2_2.1941
  %t2371 = load i64, ptr %local.g2_3.1942
  %t2372 = load i64, ptr %local.a20
  %t2373 = call i64 @"project_dim"(i64 %t2363, i64 %t2364, i64 %t2365, i64 %t2366, i64 %t2367, i64 %t2368, i64 %t2369, i64 %t2370, i64 %t2371, i64 %t2372, i64 1)
  store i64 %t2373, ptr %local.r2_1.1956
  %t2374 = load i64, ptr %local.r2_1.1956
  %t2375 = load i64, ptr %local.g1_0.1935
  %t2376 = load i64, ptr %local.g1_1.1936
  %t2377 = load i64, ptr %local.g1_2.1937
  %t2378 = load i64, ptr %local.g1_3.1938
  %t2379 = load i64, ptr %local.g2_0.1939
  %t2380 = load i64, ptr %local.g2_1.1940
  %t2381 = load i64, ptr %local.g2_2.1941
  %t2382 = load i64, ptr %local.g2_3.1942
  %t2383 = load i64, ptr %local.a21
  %t2384 = call i64 @"project_dim"(i64 %t2374, i64 %t2375, i64 %t2376, i64 %t2377, i64 %t2378, i64 %t2379, i64 %t2380, i64 %t2381, i64 %t2382, i64 %t2383, i64 1)
  store i64 %t2384, ptr %local.r2_1.1956
  %t2385 = load i64, ptr %local.r2_1.1956
  %t2386 = load i64, ptr %local.g3_0.1943
  %t2387 = load i64, ptr %local.g3_1.1944
  %t2388 = load i64, ptr %local.g3_2.1945
  %t2389 = load i64, ptr %local.g3_3.1946
  %t2390 = load i64, ptr %local.g2_0.1939
  %t2391 = load i64, ptr %local.g2_1.1940
  %t2392 = load i64, ptr %local.g2_2.1941
  %t2393 = load i64, ptr %local.g2_3.1942
  %t2394 = load i64, ptr %local.a23
  %t2395 = call i64 @"project_dim"(i64 %t2385, i64 %t2386, i64 %t2387, i64 %t2388, i64 %t2389, i64 %t2390, i64 %t2391, i64 %t2392, i64 %t2393, i64 %t2394, i64 1)
  store i64 %t2395, ptr %local.r2_1.1956
  %t2396 = load i64, ptr %local.g2_2.1941
  %t2397 = load i64, ptr %local.g0_0.1931
  %t2398 = load i64, ptr %local.g0_1.1932
  %t2399 = load i64, ptr %local.g0_2.1933
  %t2400 = load i64, ptr %local.g0_3.1934
  %t2401 = load i64, ptr %local.g2_0.1939
  %t2402 = load i64, ptr %local.g2_1.1940
  %t2403 = load i64, ptr %local.g2_2.1941
  %t2404 = load i64, ptr %local.g2_3.1942
  %t2405 = load i64, ptr %local.a20
  %t2406 = call i64 @"project_dim"(i64 %t2396, i64 %t2397, i64 %t2398, i64 %t2399, i64 %t2400, i64 %t2401, i64 %t2402, i64 %t2403, i64 %t2404, i64 %t2405, i64 2)
  store i64 %t2406, ptr %local.r2_2.1957
  %t2407 = load i64, ptr %local.r2_2.1957
  %t2408 = load i64, ptr %local.g1_0.1935
  %t2409 = load i64, ptr %local.g1_1.1936
  %t2410 = load i64, ptr %local.g1_2.1937
  %t2411 = load i64, ptr %local.g1_3.1938
  %t2412 = load i64, ptr %local.g2_0.1939
  %t2413 = load i64, ptr %local.g2_1.1940
  %t2414 = load i64, ptr %local.g2_2.1941
  %t2415 = load i64, ptr %local.g2_3.1942
  %t2416 = load i64, ptr %local.a21
  %t2417 = call i64 @"project_dim"(i64 %t2407, i64 %t2408, i64 %t2409, i64 %t2410, i64 %t2411, i64 %t2412, i64 %t2413, i64 %t2414, i64 %t2415, i64 %t2416, i64 2)
  store i64 %t2417, ptr %local.r2_2.1957
  %t2418 = load i64, ptr %local.r2_2.1957
  %t2419 = load i64, ptr %local.g3_0.1943
  %t2420 = load i64, ptr %local.g3_1.1944
  %t2421 = load i64, ptr %local.g3_2.1945
  %t2422 = load i64, ptr %local.g3_3.1946
  %t2423 = load i64, ptr %local.g2_0.1939
  %t2424 = load i64, ptr %local.g2_1.1940
  %t2425 = load i64, ptr %local.g2_2.1941
  %t2426 = load i64, ptr %local.g2_3.1942
  %t2427 = load i64, ptr %local.a23
  %t2428 = call i64 @"project_dim"(i64 %t2418, i64 %t2419, i64 %t2420, i64 %t2421, i64 %t2422, i64 %t2423, i64 %t2424, i64 %t2425, i64 %t2426, i64 %t2427, i64 2)
  store i64 %t2428, ptr %local.r2_2.1957
  %t2429 = load i64, ptr %local.g2_3.1942
  %t2430 = load i64, ptr %local.g0_0.1931
  %t2431 = load i64, ptr %local.g0_1.1932
  %t2432 = load i64, ptr %local.g0_2.1933
  %t2433 = load i64, ptr %local.g0_3.1934
  %t2434 = load i64, ptr %local.g2_0.1939
  %t2435 = load i64, ptr %local.g2_1.1940
  %t2436 = load i64, ptr %local.g2_2.1941
  %t2437 = load i64, ptr %local.g2_3.1942
  %t2438 = load i64, ptr %local.a20
  %t2439 = call i64 @"project_dim"(i64 %t2429, i64 %t2430, i64 %t2431, i64 %t2432, i64 %t2433, i64 %t2434, i64 %t2435, i64 %t2436, i64 %t2437, i64 %t2438, i64 3)
  store i64 %t2439, ptr %local.r2_3.1958
  %t2440 = load i64, ptr %local.r2_3.1958
  %t2441 = load i64, ptr %local.g1_0.1935
  %t2442 = load i64, ptr %local.g1_1.1936
  %t2443 = load i64, ptr %local.g1_2.1937
  %t2444 = load i64, ptr %local.g1_3.1938
  %t2445 = load i64, ptr %local.g2_0.1939
  %t2446 = load i64, ptr %local.g2_1.1940
  %t2447 = load i64, ptr %local.g2_2.1941
  %t2448 = load i64, ptr %local.g2_3.1942
  %t2449 = load i64, ptr %local.a21
  %t2450 = call i64 @"project_dim"(i64 %t2440, i64 %t2441, i64 %t2442, i64 %t2443, i64 %t2444, i64 %t2445, i64 %t2446, i64 %t2447, i64 %t2448, i64 %t2449, i64 3)
  store i64 %t2450, ptr %local.r2_3.1958
  %t2451 = load i64, ptr %local.r2_3.1958
  %t2452 = load i64, ptr %local.g3_0.1943
  %t2453 = load i64, ptr %local.g3_1.1944
  %t2454 = load i64, ptr %local.g3_2.1945
  %t2455 = load i64, ptr %local.g3_3.1946
  %t2456 = load i64, ptr %local.g2_0.1939
  %t2457 = load i64, ptr %local.g2_1.1940
  %t2458 = load i64, ptr %local.g2_2.1941
  %t2459 = load i64, ptr %local.g2_3.1942
  %t2460 = load i64, ptr %local.a23
  %t2461 = call i64 @"project_dim"(i64 %t2451, i64 %t2452, i64 %t2453, i64 %t2454, i64 %t2455, i64 %t2456, i64 %t2457, i64 %t2458, i64 %t2459, i64 %t2460, i64 3)
  store i64 %t2461, ptr %local.r2_3.1958
  %t2462 = load i64, ptr %local.g3_0.1943
  %t2463 = load i64, ptr %local.g0_0.1931
  %t2464 = load i64, ptr %local.g0_1.1932
  %t2465 = load i64, ptr %local.g0_2.1933
  %t2466 = load i64, ptr %local.g0_3.1934
  %t2467 = load i64, ptr %local.g3_0.1943
  %t2468 = load i64, ptr %local.g3_1.1944
  %t2469 = load i64, ptr %local.g3_2.1945
  %t2470 = load i64, ptr %local.g3_3.1946
  %t2471 = load i64, ptr %local.a30
  %t2472 = call i64 @"project_dim"(i64 %t2462, i64 %t2463, i64 %t2464, i64 %t2465, i64 %t2466, i64 %t2467, i64 %t2468, i64 %t2469, i64 %t2470, i64 %t2471, i64 0)
  store i64 %t2472, ptr %local.r3_0.1959
  %t2473 = load i64, ptr %local.r3_0.1959
  %t2474 = load i64, ptr %local.g1_0.1935
  %t2475 = load i64, ptr %local.g1_1.1936
  %t2476 = load i64, ptr %local.g1_2.1937
  %t2477 = load i64, ptr %local.g1_3.1938
  %t2478 = load i64, ptr %local.g3_0.1943
  %t2479 = load i64, ptr %local.g3_1.1944
  %t2480 = load i64, ptr %local.g3_2.1945
  %t2481 = load i64, ptr %local.g3_3.1946
  %t2482 = load i64, ptr %local.a31
  %t2483 = call i64 @"project_dim"(i64 %t2473, i64 %t2474, i64 %t2475, i64 %t2476, i64 %t2477, i64 %t2478, i64 %t2479, i64 %t2480, i64 %t2481, i64 %t2482, i64 0)
  store i64 %t2483, ptr %local.r3_0.1959
  %t2484 = load i64, ptr %local.r3_0.1959
  %t2485 = load i64, ptr %local.g2_0.1939
  %t2486 = load i64, ptr %local.g2_1.1940
  %t2487 = load i64, ptr %local.g2_2.1941
  %t2488 = load i64, ptr %local.g2_3.1942
  %t2489 = load i64, ptr %local.g3_0.1943
  %t2490 = load i64, ptr %local.g3_1.1944
  %t2491 = load i64, ptr %local.g3_2.1945
  %t2492 = load i64, ptr %local.g3_3.1946
  %t2493 = load i64, ptr %local.a32
  %t2494 = call i64 @"project_dim"(i64 %t2484, i64 %t2485, i64 %t2486, i64 %t2487, i64 %t2488, i64 %t2489, i64 %t2490, i64 %t2491, i64 %t2492, i64 %t2493, i64 0)
  store i64 %t2494, ptr %local.r3_0.1959
  %t2495 = load i64, ptr %local.g3_1.1944
  %t2496 = load i64, ptr %local.g0_0.1931
  %t2497 = load i64, ptr %local.g0_1.1932
  %t2498 = load i64, ptr %local.g0_2.1933
  %t2499 = load i64, ptr %local.g0_3.1934
  %t2500 = load i64, ptr %local.g3_0.1943
  %t2501 = load i64, ptr %local.g3_1.1944
  %t2502 = load i64, ptr %local.g3_2.1945
  %t2503 = load i64, ptr %local.g3_3.1946
  %t2504 = load i64, ptr %local.a30
  %t2505 = call i64 @"project_dim"(i64 %t2495, i64 %t2496, i64 %t2497, i64 %t2498, i64 %t2499, i64 %t2500, i64 %t2501, i64 %t2502, i64 %t2503, i64 %t2504, i64 1)
  store i64 %t2505, ptr %local.r3_1.1960
  %t2506 = load i64, ptr %local.r3_1.1960
  %t2507 = load i64, ptr %local.g1_0.1935
  %t2508 = load i64, ptr %local.g1_1.1936
  %t2509 = load i64, ptr %local.g1_2.1937
  %t2510 = load i64, ptr %local.g1_3.1938
  %t2511 = load i64, ptr %local.g3_0.1943
  %t2512 = load i64, ptr %local.g3_1.1944
  %t2513 = load i64, ptr %local.g3_2.1945
  %t2514 = load i64, ptr %local.g3_3.1946
  %t2515 = load i64, ptr %local.a31
  %t2516 = call i64 @"project_dim"(i64 %t2506, i64 %t2507, i64 %t2508, i64 %t2509, i64 %t2510, i64 %t2511, i64 %t2512, i64 %t2513, i64 %t2514, i64 %t2515, i64 1)
  store i64 %t2516, ptr %local.r3_1.1960
  %t2517 = load i64, ptr %local.r3_1.1960
  %t2518 = load i64, ptr %local.g2_0.1939
  %t2519 = load i64, ptr %local.g2_1.1940
  %t2520 = load i64, ptr %local.g2_2.1941
  %t2521 = load i64, ptr %local.g2_3.1942
  %t2522 = load i64, ptr %local.g3_0.1943
  %t2523 = load i64, ptr %local.g3_1.1944
  %t2524 = load i64, ptr %local.g3_2.1945
  %t2525 = load i64, ptr %local.g3_3.1946
  %t2526 = load i64, ptr %local.a32
  %t2527 = call i64 @"project_dim"(i64 %t2517, i64 %t2518, i64 %t2519, i64 %t2520, i64 %t2521, i64 %t2522, i64 %t2523, i64 %t2524, i64 %t2525, i64 %t2526, i64 1)
  store i64 %t2527, ptr %local.r3_1.1960
  %t2528 = load i64, ptr %local.g3_2.1945
  %t2529 = load i64, ptr %local.g0_0.1931
  %t2530 = load i64, ptr %local.g0_1.1932
  %t2531 = load i64, ptr %local.g0_2.1933
  %t2532 = load i64, ptr %local.g0_3.1934
  %t2533 = load i64, ptr %local.g3_0.1943
  %t2534 = load i64, ptr %local.g3_1.1944
  %t2535 = load i64, ptr %local.g3_2.1945
  %t2536 = load i64, ptr %local.g3_3.1946
  %t2537 = load i64, ptr %local.a30
  %t2538 = call i64 @"project_dim"(i64 %t2528, i64 %t2529, i64 %t2530, i64 %t2531, i64 %t2532, i64 %t2533, i64 %t2534, i64 %t2535, i64 %t2536, i64 %t2537, i64 2)
  store i64 %t2538, ptr %local.r3_2.1961
  %t2539 = load i64, ptr %local.r3_2.1961
  %t2540 = load i64, ptr %local.g1_0.1935
  %t2541 = load i64, ptr %local.g1_1.1936
  %t2542 = load i64, ptr %local.g1_2.1937
  %t2543 = load i64, ptr %local.g1_3.1938
  %t2544 = load i64, ptr %local.g3_0.1943
  %t2545 = load i64, ptr %local.g3_1.1944
  %t2546 = load i64, ptr %local.g3_2.1945
  %t2547 = load i64, ptr %local.g3_3.1946
  %t2548 = load i64, ptr %local.a31
  %t2549 = call i64 @"project_dim"(i64 %t2539, i64 %t2540, i64 %t2541, i64 %t2542, i64 %t2543, i64 %t2544, i64 %t2545, i64 %t2546, i64 %t2547, i64 %t2548, i64 2)
  store i64 %t2549, ptr %local.r3_2.1961
  %t2550 = load i64, ptr %local.r3_2.1961
  %t2551 = load i64, ptr %local.g2_0.1939
  %t2552 = load i64, ptr %local.g2_1.1940
  %t2553 = load i64, ptr %local.g2_2.1941
  %t2554 = load i64, ptr %local.g2_3.1942
  %t2555 = load i64, ptr %local.g3_0.1943
  %t2556 = load i64, ptr %local.g3_1.1944
  %t2557 = load i64, ptr %local.g3_2.1945
  %t2558 = load i64, ptr %local.g3_3.1946
  %t2559 = load i64, ptr %local.a32
  %t2560 = call i64 @"project_dim"(i64 %t2550, i64 %t2551, i64 %t2552, i64 %t2553, i64 %t2554, i64 %t2555, i64 %t2556, i64 %t2557, i64 %t2558, i64 %t2559, i64 2)
  store i64 %t2560, ptr %local.r3_2.1961
  %t2561 = load i64, ptr %local.g3_3.1946
  %t2562 = load i64, ptr %local.g0_0.1931
  %t2563 = load i64, ptr %local.g0_1.1932
  %t2564 = load i64, ptr %local.g0_2.1933
  %t2565 = load i64, ptr %local.g0_3.1934
  %t2566 = load i64, ptr %local.g3_0.1943
  %t2567 = load i64, ptr %local.g3_1.1944
  %t2568 = load i64, ptr %local.g3_2.1945
  %t2569 = load i64, ptr %local.g3_3.1946
  %t2570 = load i64, ptr %local.a30
  %t2571 = call i64 @"project_dim"(i64 %t2561, i64 %t2562, i64 %t2563, i64 %t2564, i64 %t2565, i64 %t2566, i64 %t2567, i64 %t2568, i64 %t2569, i64 %t2570, i64 3)
  store i64 %t2571, ptr %local.r3_3.1962
  %t2572 = load i64, ptr %local.r3_3.1962
  %t2573 = load i64, ptr %local.g1_0.1935
  %t2574 = load i64, ptr %local.g1_1.1936
  %t2575 = load i64, ptr %local.g1_2.1937
  %t2576 = load i64, ptr %local.g1_3.1938
  %t2577 = load i64, ptr %local.g3_0.1943
  %t2578 = load i64, ptr %local.g3_1.1944
  %t2579 = load i64, ptr %local.g3_2.1945
  %t2580 = load i64, ptr %local.g3_3.1946
  %t2581 = load i64, ptr %local.a31
  %t2582 = call i64 @"project_dim"(i64 %t2572, i64 %t2573, i64 %t2574, i64 %t2575, i64 %t2576, i64 %t2577, i64 %t2578, i64 %t2579, i64 %t2580, i64 %t2581, i64 3)
  store i64 %t2582, ptr %local.r3_3.1962
  %t2583 = load i64, ptr %local.r3_3.1962
  %t2584 = load i64, ptr %local.g2_0.1939
  %t2585 = load i64, ptr %local.g2_1.1940
  %t2586 = load i64, ptr %local.g2_2.1941
  %t2587 = load i64, ptr %local.g2_3.1942
  %t2588 = load i64, ptr %local.g3_0.1943
  %t2589 = load i64, ptr %local.g3_1.1944
  %t2590 = load i64, ptr %local.g3_2.1945
  %t2591 = load i64, ptr %local.g3_3.1946
  %t2592 = load i64, ptr %local.a32
  %t2593 = call i64 @"project_dim"(i64 %t2583, i64 %t2584, i64 %t2585, i64 %t2586, i64 %t2587, i64 %t2588, i64 %t2589, i64 %t2590, i64 %t2591, i64 %t2592, i64 3)
  store i64 %t2593, ptr %local.r3_3.1962
  %t2594 = load i64, ptr %local.w0.1926
  %t2595 = load i64, ptr %local.lr.1963
  %t2596 = load i64, ptr %local.r0_0.1947
  %t2597 = load i64, ptr %local.r1_0.1951
  %t2598 = call i64 @"sx_f64_add"(i64 %t2596, i64 %t2597)
  %t2599 = load i64, ptr %local.r2_0.1955
  %t2600 = call i64 @"sx_f64_add"(i64 %t2598, i64 %t2599)
  %t2601 = load i64, ptr %local.r3_0.1959
  %t2602 = call i64 @"sx_f64_add"(i64 %t2600, i64 %t2601)
  %t2603 = call i64 @"sx_f64_mul"(i64 %t2595, i64 %t2602)
  %t2604 = call i64 @"sx_f64_sub"(i64 %t2594, i64 %t2603)
  store i64 %t2604, ptr %local.w0.1926
  %t2605 = load i64, ptr %local.w1.1927
  %t2606 = load i64, ptr %local.lr.1963
  %t2607 = load i64, ptr %local.r0_1.1948
  %t2608 = load i64, ptr %local.r1_1.1952
  %t2609 = call i64 @"sx_f64_add"(i64 %t2607, i64 %t2608)
  %t2610 = load i64, ptr %local.r2_1.1956
  %t2611 = call i64 @"sx_f64_add"(i64 %t2609, i64 %t2610)
  %t2612 = load i64, ptr %local.r3_1.1960
  %t2613 = call i64 @"sx_f64_add"(i64 %t2611, i64 %t2612)
  %t2614 = call i64 @"sx_f64_mul"(i64 %t2606, i64 %t2613)
  %t2615 = call i64 @"sx_f64_sub"(i64 %t2605, i64 %t2614)
  store i64 %t2615, ptr %local.w1.1927
  %t2616 = load i64, ptr %local.w2.1928
  %t2617 = load i64, ptr %local.lr.1963
  %t2618 = load i64, ptr %local.r0_2.1949
  %t2619 = load i64, ptr %local.r1_2.1953
  %t2620 = call i64 @"sx_f64_add"(i64 %t2618, i64 %t2619)
  %t2621 = load i64, ptr %local.r2_2.1957
  %t2622 = call i64 @"sx_f64_add"(i64 %t2620, i64 %t2621)
  %t2623 = load i64, ptr %local.r3_2.1961
  %t2624 = call i64 @"sx_f64_add"(i64 %t2622, i64 %t2623)
  %t2625 = call i64 @"sx_f64_mul"(i64 %t2617, i64 %t2624)
  %t2626 = call i64 @"sx_f64_sub"(i64 %t2616, i64 %t2625)
  store i64 %t2626, ptr %local.w2.1928
  %t2627 = load i64, ptr %local.w3.1929
  %t2628 = load i64, ptr %local.lr.1963
  %t2629 = load i64, ptr %local.r0_3.1950
  %t2630 = load i64, ptr %local.r1_3.1954
  %t2631 = call i64 @"sx_f64_add"(i64 %t2629, i64 %t2630)
  %t2632 = load i64, ptr %local.r2_3.1958
  %t2633 = call i64 @"sx_f64_add"(i64 %t2631, i64 %t2632)
  %t2634 = load i64, ptr %local.r3_3.1962
  %t2635 = call i64 @"sx_f64_add"(i64 %t2633, i64 %t2634)
  %t2636 = call i64 @"sx_f64_mul"(i64 %t2628, i64 %t2635)
  %t2637 = call i64 @"sx_f64_sub"(i64 %t2627, i64 %t2636)
  store i64 %t2637, ptr %local.w3.1929
  %t2638 = load i64, ptr %local.step.1930
  %t2639 = add i64 %t2638, 1
  store i64 %t2639, ptr %local.step.1930
  br label %loop54
endloop54:
  %t2640 = load i64, ptr %local.w0.1926
  %t2641 = load i64, ptr %local.w1.1927
  %t2642 = load i64, ptr %local.w2.1928
  %t2643 = load i64, ptr %local.w3.1929
  %t2644 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.330)
  %t2645 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.331)
  %t2646 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.332)
  %t2647 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.333)
  %t2648 = call i64 @"loss4"(i64 %t2640, i64 %t2641, i64 %t2642, i64 %t2643, i64 %t2644, i64 %t2645, i64 %t2646, i64 %t2647)
  store i64 %t2648, ptr %local.l0.1964
  %t2649 = load i64, ptr %local.w0.1926
  %t2650 = load i64, ptr %local.w1.1927
  %t2651 = load i64, ptr %local.w2.1928
  %t2652 = load i64, ptr %local.w3.1929
  %t2653 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.334)
  %t2654 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.335)
  %t2655 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.336)
  %t2656 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.337)
  %t2657 = call i64 @"loss4"(i64 %t2649, i64 %t2650, i64 %t2651, i64 %t2652, i64 %t2653, i64 %t2654, i64 %t2655, i64 %t2656)
  store i64 %t2657, ptr %local.l1.1965
  %t2658 = load i64, ptr %local.w0.1926
  %t2659 = load i64, ptr %local.w1.1927
  %t2660 = load i64, ptr %local.w2.1928
  %t2661 = load i64, ptr %local.w3.1929
  %t2662 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.338)
  %t2663 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.339)
  %t2664 = call i64 @"sx_f64_sub"(i64 %t2662, i64 %t2663)
  %t2665 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.340)
  %t2666 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.341)
  %t2667 = call i64 @"sx_f64_sub"(i64 %t2665, i64 %t2666)
  %t2668 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.342)
  %t2669 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.343)
  %t2670 = call i64 @"loss4"(i64 %t2658, i64 %t2659, i64 %t2660, i64 %t2661, i64 %t2664, i64 %t2667, i64 %t2668, i64 %t2669)
  store i64 %t2670, ptr %local.l2.1966
  %t2671 = load i64, ptr %local.w0.1926
  %t2672 = load i64, ptr %local.w1.1927
  %t2673 = load i64, ptr %local.w2.1928
  %t2674 = load i64, ptr %local.w3.1929
  %t2675 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.344)
  %t2676 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.345)
  %t2677 = call i64 @"sx_f64_sub"(i64 %t2675, i64 %t2676)
  %t2678 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.346)
  %t2679 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.347)
  %t2680 = call i64 @"sx_f64_sub"(i64 %t2678, i64 %t2679)
  %t2681 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.348)
  %t2682 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.349)
  %t2683 = call i64 @"loss4"(i64 %t2671, i64 %t2672, i64 %t2673, i64 %t2674, i64 %t2677, i64 %t2680, i64 %t2681, i64 %t2682)
  store i64 %t2683, ptr %local.l3.1967
  %t2684 = load i64, ptr %local.l0.1964
  %t2685 = load i64, ptr %local.l1.1965
  %t2686 = call i64 @"sx_f64_add"(i64 %t2684, i64 %t2685)
  %t2687 = load i64, ptr %local.l2.1966
  %t2688 = call i64 @"sx_f64_add"(i64 %t2686, i64 %t2687)
  %t2689 = load i64, ptr %local.l3.1967
  %t2690 = call i64 @"sx_f64_add"(i64 %t2688, i64 %t2689)
  ret i64 %t2690
}

define i64 @"exp4_meta_grad"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %which, i64 %steps) nounwind {
entry:
  %local.h.2691 = alloca i64
  %local.p01.2692 = alloca i64
  %local.p02.2693 = alloca i64
  %local.p03.2694 = alloca i64
  %local.p10.2695 = alloca i64
  %local.p12.2696 = alloca i64
  %local.p13.2697 = alloca i64
  %local.p20.2698 = alloca i64
  %local.p21.2699 = alloca i64
  %local.p23.2700 = alloca i64
  %local.p30.2701 = alloca i64
  %local.p31.2702 = alloca i64
  %local.p32.2703 = alloca i64
  %local.m01.2704 = alloca i64
  %local.m02.2705 = alloca i64
  %local.m03.2706 = alloca i64
  %local.m10.2707 = alloca i64
  %local.m12.2708 = alloca i64
  %local.m13.2709 = alloca i64
  %local.m20.2710 = alloca i64
  %local.m21.2711 = alloca i64
  %local.m23.2712 = alloca i64
  %local.m30.2713 = alloca i64
  %local.m31.2714 = alloca i64
  %local.m32.2715 = alloca i64
  %local.lp.2716 = alloca i64
  %local.lm.2717 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t2718 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.350)
  store i64 %t2718, ptr %local.h.2691
  %t2719 = load i64, ptr %local.a01
  store i64 %t2719, ptr %local.p01.2692
  %t2720 = load i64, ptr %local.a02
  store i64 %t2720, ptr %local.p02.2693
  %t2721 = load i64, ptr %local.a03
  store i64 %t2721, ptr %local.p03.2694
  %t2722 = load i64, ptr %local.a10
  store i64 %t2722, ptr %local.p10.2695
  %t2723 = load i64, ptr %local.a12
  store i64 %t2723, ptr %local.p12.2696
  %t2724 = load i64, ptr %local.a13
  store i64 %t2724, ptr %local.p13.2697
  %t2725 = load i64, ptr %local.a20
  store i64 %t2725, ptr %local.p20.2698
  %t2726 = load i64, ptr %local.a21
  store i64 %t2726, ptr %local.p21.2699
  %t2727 = load i64, ptr %local.a23
  store i64 %t2727, ptr %local.p23.2700
  %t2728 = load i64, ptr %local.a30
  store i64 %t2728, ptr %local.p30.2701
  %t2729 = load i64, ptr %local.a31
  store i64 %t2729, ptr %local.p31.2702
  %t2730 = load i64, ptr %local.a32
  store i64 %t2730, ptr %local.p32.2703
  %t2731 = load i64, ptr %local.a01
  store i64 %t2731, ptr %local.m01.2704
  %t2732 = load i64, ptr %local.a02
  store i64 %t2732, ptr %local.m02.2705
  %t2733 = load i64, ptr %local.a03
  store i64 %t2733, ptr %local.m03.2706
  %t2734 = load i64, ptr %local.a10
  store i64 %t2734, ptr %local.m10.2707
  %t2735 = load i64, ptr %local.a12
  store i64 %t2735, ptr %local.m12.2708
  %t2736 = load i64, ptr %local.a13
  store i64 %t2736, ptr %local.m13.2709
  %t2737 = load i64, ptr %local.a20
  store i64 %t2737, ptr %local.m20.2710
  %t2738 = load i64, ptr %local.a21
  store i64 %t2738, ptr %local.m21.2711
  %t2739 = load i64, ptr %local.a23
  store i64 %t2739, ptr %local.m23.2712
  %t2740 = load i64, ptr %local.a30
  store i64 %t2740, ptr %local.m30.2713
  %t2741 = load i64, ptr %local.a31
  store i64 %t2741, ptr %local.m31.2714
  %t2742 = load i64, ptr %local.a32
  store i64 %t2742, ptr %local.m32.2715
  %t2743 = load i64, ptr %local.which
  %t2744 = icmp eq i64 %t2743, 0
  %t2745 = zext i1 %t2744 to i64
  %t2746 = icmp ne i64 %t2745, 0
  br i1 %t2746, label %then55, label %else55
then55:
  %t2747 = load i64, ptr %local.a01
  %t2748 = load i64, ptr %local.h.2691
  %t2749 = call i64 @"sx_f64_add"(i64 %t2747, i64 %t2748)
  store i64 %t2749, ptr %local.p01.2692
  %t2750 = load i64, ptr %local.a01
  %t2751 = load i64, ptr %local.h.2691
  %t2752 = call i64 @"sx_f64_sub"(i64 %t2750, i64 %t2751)
  store i64 %t2752, ptr %local.m01.2704
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t2753 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t2754 = load i64, ptr %local.which
  %t2755 = icmp eq i64 %t2754, 1
  %t2756 = zext i1 %t2755 to i64
  %t2757 = icmp ne i64 %t2756, 0
  br i1 %t2757, label %then56, label %else56
then56:
  %t2758 = load i64, ptr %local.a02
  %t2759 = load i64, ptr %local.h.2691
  %t2760 = call i64 @"sx_f64_add"(i64 %t2758, i64 %t2759)
  store i64 %t2760, ptr %local.p02.2693
  %t2761 = load i64, ptr %local.a02
  %t2762 = load i64, ptr %local.h.2691
  %t2763 = call i64 @"sx_f64_sub"(i64 %t2761, i64 %t2762)
  store i64 %t2763, ptr %local.m02.2705
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t2764 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t2765 = load i64, ptr %local.which
  %t2766 = icmp eq i64 %t2765, 2
  %t2767 = zext i1 %t2766 to i64
  %t2768 = icmp ne i64 %t2767, 0
  br i1 %t2768, label %then57, label %else57
then57:
  %t2769 = load i64, ptr %local.a03
  %t2770 = load i64, ptr %local.h.2691
  %t2771 = call i64 @"sx_f64_add"(i64 %t2769, i64 %t2770)
  store i64 %t2771, ptr %local.p03.2694
  %t2772 = load i64, ptr %local.a03
  %t2773 = load i64, ptr %local.h.2691
  %t2774 = call i64 @"sx_f64_sub"(i64 %t2772, i64 %t2773)
  store i64 %t2774, ptr %local.m03.2706
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t2775 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t2776 = load i64, ptr %local.which
  %t2777 = icmp eq i64 %t2776, 3
  %t2778 = zext i1 %t2777 to i64
  %t2779 = icmp ne i64 %t2778, 0
  br i1 %t2779, label %then58, label %else58
then58:
  %t2780 = load i64, ptr %local.a10
  %t2781 = load i64, ptr %local.h.2691
  %t2782 = call i64 @"sx_f64_add"(i64 %t2780, i64 %t2781)
  store i64 %t2782, ptr %local.p10.2695
  %t2783 = load i64, ptr %local.a10
  %t2784 = load i64, ptr %local.h.2691
  %t2785 = call i64 @"sx_f64_sub"(i64 %t2783, i64 %t2784)
  store i64 %t2785, ptr %local.m10.2707
  br label %then58_end
then58_end:
  br label %endif58
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t2786 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t2787 = load i64, ptr %local.which
  %t2788 = icmp eq i64 %t2787, 4
  %t2789 = zext i1 %t2788 to i64
  %t2790 = icmp ne i64 %t2789, 0
  br i1 %t2790, label %then59, label %else59
then59:
  %t2791 = load i64, ptr %local.a12
  %t2792 = load i64, ptr %local.h.2691
  %t2793 = call i64 @"sx_f64_add"(i64 %t2791, i64 %t2792)
  store i64 %t2793, ptr %local.p12.2696
  %t2794 = load i64, ptr %local.a12
  %t2795 = load i64, ptr %local.h.2691
  %t2796 = call i64 @"sx_f64_sub"(i64 %t2794, i64 %t2795)
  store i64 %t2796, ptr %local.m12.2708
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t2797 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t2798 = load i64, ptr %local.which
  %t2799 = icmp eq i64 %t2798, 5
  %t2800 = zext i1 %t2799 to i64
  %t2801 = icmp ne i64 %t2800, 0
  br i1 %t2801, label %then60, label %else60
then60:
  %t2802 = load i64, ptr %local.a13
  %t2803 = load i64, ptr %local.h.2691
  %t2804 = call i64 @"sx_f64_add"(i64 %t2802, i64 %t2803)
  store i64 %t2804, ptr %local.p13.2697
  %t2805 = load i64, ptr %local.a13
  %t2806 = load i64, ptr %local.h.2691
  %t2807 = call i64 @"sx_f64_sub"(i64 %t2805, i64 %t2806)
  store i64 %t2807, ptr %local.m13.2709
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t2808 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  %t2809 = load i64, ptr %local.which
  %t2810 = icmp eq i64 %t2809, 6
  %t2811 = zext i1 %t2810 to i64
  %t2812 = icmp ne i64 %t2811, 0
  br i1 %t2812, label %then61, label %else61
then61:
  %t2813 = load i64, ptr %local.a20
  %t2814 = load i64, ptr %local.h.2691
  %t2815 = call i64 @"sx_f64_add"(i64 %t2813, i64 %t2814)
  store i64 %t2815, ptr %local.p20.2698
  %t2816 = load i64, ptr %local.a20
  %t2817 = load i64, ptr %local.h.2691
  %t2818 = call i64 @"sx_f64_sub"(i64 %t2816, i64 %t2817)
  store i64 %t2818, ptr %local.m20.2710
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t2819 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t2820 = load i64, ptr %local.which
  %t2821 = icmp eq i64 %t2820, 7
  %t2822 = zext i1 %t2821 to i64
  %t2823 = icmp ne i64 %t2822, 0
  br i1 %t2823, label %then62, label %else62
then62:
  %t2824 = load i64, ptr %local.a21
  %t2825 = load i64, ptr %local.h.2691
  %t2826 = call i64 @"sx_f64_add"(i64 %t2824, i64 %t2825)
  store i64 %t2826, ptr %local.p21.2699
  %t2827 = load i64, ptr %local.a21
  %t2828 = load i64, ptr %local.h.2691
  %t2829 = call i64 @"sx_f64_sub"(i64 %t2827, i64 %t2828)
  store i64 %t2829, ptr %local.m21.2711
  br label %then62_end
then62_end:
  br label %endif62
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t2830 = phi i64 [ 0, %then62_end ], [ 0, %else62_end ]
  %t2831 = load i64, ptr %local.which
  %t2832 = icmp eq i64 %t2831, 8
  %t2833 = zext i1 %t2832 to i64
  %t2834 = icmp ne i64 %t2833, 0
  br i1 %t2834, label %then63, label %else63
then63:
  %t2835 = load i64, ptr %local.a23
  %t2836 = load i64, ptr %local.h.2691
  %t2837 = call i64 @"sx_f64_add"(i64 %t2835, i64 %t2836)
  store i64 %t2837, ptr %local.p23.2700
  %t2838 = load i64, ptr %local.a23
  %t2839 = load i64, ptr %local.h.2691
  %t2840 = call i64 @"sx_f64_sub"(i64 %t2838, i64 %t2839)
  store i64 %t2840, ptr %local.m23.2712
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t2841 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t2842 = load i64, ptr %local.which
  %t2843 = icmp eq i64 %t2842, 9
  %t2844 = zext i1 %t2843 to i64
  %t2845 = icmp ne i64 %t2844, 0
  br i1 %t2845, label %then64, label %else64
then64:
  %t2846 = load i64, ptr %local.a30
  %t2847 = load i64, ptr %local.h.2691
  %t2848 = call i64 @"sx_f64_add"(i64 %t2846, i64 %t2847)
  store i64 %t2848, ptr %local.p30.2701
  %t2849 = load i64, ptr %local.a30
  %t2850 = load i64, ptr %local.h.2691
  %t2851 = call i64 @"sx_f64_sub"(i64 %t2849, i64 %t2850)
  store i64 %t2851, ptr %local.m30.2713
  br label %then64_end
then64_end:
  br label %endif64
else64:
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t2852 = phi i64 [ 0, %then64_end ], [ 0, %else64_end ]
  %t2853 = load i64, ptr %local.which
  %t2854 = icmp eq i64 %t2853, 10
  %t2855 = zext i1 %t2854 to i64
  %t2856 = icmp ne i64 %t2855, 0
  br i1 %t2856, label %then65, label %else65
then65:
  %t2857 = load i64, ptr %local.a31
  %t2858 = load i64, ptr %local.h.2691
  %t2859 = call i64 @"sx_f64_add"(i64 %t2857, i64 %t2858)
  store i64 %t2859, ptr %local.p31.2702
  %t2860 = load i64, ptr %local.a31
  %t2861 = load i64, ptr %local.h.2691
  %t2862 = call i64 @"sx_f64_sub"(i64 %t2860, i64 %t2861)
  store i64 %t2862, ptr %local.m31.2714
  br label %then65_end
then65_end:
  br label %endif65
else65:
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t2863 = phi i64 [ 0, %then65_end ], [ 0, %else65_end ]
  %t2864 = load i64, ptr %local.which
  %t2865 = icmp eq i64 %t2864, 11
  %t2866 = zext i1 %t2865 to i64
  %t2867 = icmp ne i64 %t2866, 0
  br i1 %t2867, label %then66, label %else66
then66:
  %t2868 = load i64, ptr %local.a32
  %t2869 = load i64, ptr %local.h.2691
  %t2870 = call i64 @"sx_f64_add"(i64 %t2868, i64 %t2869)
  store i64 %t2870, ptr %local.p32.2703
  %t2871 = load i64, ptr %local.a32
  %t2872 = load i64, ptr %local.h.2691
  %t2873 = call i64 @"sx_f64_sub"(i64 %t2871, i64 %t2872)
  store i64 %t2873, ptr %local.m32.2715
  br label %then66_end
then66_end:
  br label %endif66
else66:
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t2874 = phi i64 [ 0, %then66_end ], [ 0, %else66_end ]
  %t2875 = load i64, ptr %local.p01.2692
  %t2876 = load i64, ptr %local.p02.2693
  %t2877 = load i64, ptr %local.p03.2694
  %t2878 = load i64, ptr %local.p10.2695
  %t2879 = load i64, ptr %local.p12.2696
  %t2880 = load i64, ptr %local.p13.2697
  %t2881 = load i64, ptr %local.p20.2698
  %t2882 = load i64, ptr %local.p21.2699
  %t2883 = load i64, ptr %local.p23.2700
  %t2884 = load i64, ptr %local.p30.2701
  %t2885 = load i64, ptr %local.p31.2702
  %t2886 = load i64, ptr %local.p32.2703
  %t2887 = load i64, ptr %local.steps
  %t2888 = call i64 @"exp4_run_cycle"(i64 %t2875, i64 %t2876, i64 %t2877, i64 %t2878, i64 %t2879, i64 %t2880, i64 %t2881, i64 %t2882, i64 %t2883, i64 %t2884, i64 %t2885, i64 %t2886, i64 %t2887)
  store i64 %t2888, ptr %local.lp.2716
  %t2889 = load i64, ptr %local.m01.2704
  %t2890 = load i64, ptr %local.m02.2705
  %t2891 = load i64, ptr %local.m03.2706
  %t2892 = load i64, ptr %local.m10.2707
  %t2893 = load i64, ptr %local.m12.2708
  %t2894 = load i64, ptr %local.m13.2709
  %t2895 = load i64, ptr %local.m20.2710
  %t2896 = load i64, ptr %local.m21.2711
  %t2897 = load i64, ptr %local.m23.2712
  %t2898 = load i64, ptr %local.m30.2713
  %t2899 = load i64, ptr %local.m31.2714
  %t2900 = load i64, ptr %local.m32.2715
  %t2901 = load i64, ptr %local.steps
  %t2902 = call i64 @"exp4_run_cycle"(i64 %t2889, i64 %t2890, i64 %t2891, i64 %t2892, i64 %t2893, i64 %t2894, i64 %t2895, i64 %t2896, i64 %t2897, i64 %t2898, i64 %t2899, i64 %t2900, i64 %t2901)
  store i64 %t2902, ptr %local.lm.2717
  %t2903 = load i64, ptr %local.lp.2716
  %t2904 = load i64, ptr %local.lm.2717
  %t2905 = call i64 @"sx_f64_sub"(i64 %t2903, i64 %t2904)
  %t2906 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.351)
  %t2907 = load i64, ptr %local.h.2691
  %t2908 = call i64 @"sx_f64_mul"(i64 %t2906, i64 %t2907)
  %t2909 = call i64 @"sx_f64_div"(i64 %t2905, i64 %t2908)
  ret i64 %t2909
}

define i64 @"run_exp4"() nounwind {
entry:
  %local.a01.2910 = alloca i64
  %local.a02.2911 = alloca i64
  %local.a03.2912 = alloca i64
  %local.a10.2913 = alloca i64
  %local.a12.2914 = alloca i64
  %local.a13.2915 = alloca i64
  %local.a20.2916 = alloca i64
  %local.a21.2917 = alloca i64
  %local.a23.2918 = alloca i64
  %local.a30.2919 = alloca i64
  %local.a31.2920 = alloca i64
  %local.a32.2921 = alloca i64
  %local.cycle.2922 = alloca i64
  %local.mg.2923 = alloca i64
  %local.loss.2924 = alloca i64
  %local.w.2925 = alloca i64
  %local.meta_lr.2926 = alloca i64
  %local.inner_steps.2927 = alloca i64
  %local.meta_cycles.2928 = alloca i64
  %local.within_avg.2929 = alloca i64
  %local.between_avg.2930 = alloca i64
  %local.gap.2931 = alloca i64
  %t2932 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.352)
  store i64 %t2932, ptr %local.a01.2910
  %t2933 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.353)
  store i64 %t2933, ptr %local.a02.2911
  %t2934 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.354)
  store i64 %t2934, ptr %local.a03.2912
  %t2935 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.355)
  store i64 %t2935, ptr %local.a10.2913
  %t2936 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.356)
  store i64 %t2936, ptr %local.a12.2914
  %t2937 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.357)
  store i64 %t2937, ptr %local.a13.2915
  %t2938 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.358)
  store i64 %t2938, ptr %local.a20.2916
  %t2939 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.359)
  store i64 %t2939, ptr %local.a21.2917
  %t2940 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.360)
  store i64 %t2940, ptr %local.a23.2918
  %t2941 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.361)
  store i64 %t2941, ptr %local.a30.2919
  %t2942 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.362)
  store i64 %t2942, ptr %local.a31.2920
  %t2943 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.363)
  store i64 %t2943, ptr %local.a32.2921
  store i64 0, ptr %local.cycle.2922
  %t2944 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.364)
  store i64 %t2944, ptr %local.mg.2923
  %t2945 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.365)
  store i64 %t2945, ptr %local.loss.2924
  store i64 0, ptr %local.w.2925
  %t2946 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.366)
  store i64 %t2946, ptr %local.meta_lr.2926
  store i64 200, ptr %local.inner_steps.2927
  store i64 40, ptr %local.meta_cycles.2928
  %t2947 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.367)
  %t2948 = ptrtoint ptr %t2947 to i64
  %t2949 = inttoptr i64 %t2948 to ptr
  call void @intrinsic_println(ptr %t2949)
  %t2950 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.368)
  %t2951 = ptrtoint ptr %t2950 to i64
  %t2952 = inttoptr i64 %t2951 to ptr
  call void @intrinsic_println(ptr %t2952)
  %t2953 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.369)
  %t2954 = ptrtoint ptr %t2953 to i64
  %t2955 = inttoptr i64 %t2954 to ptr
  call void @intrinsic_println(ptr %t2955)
  %t2956 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.370)
  %t2957 = ptrtoint ptr %t2956 to i64
  %t2958 = inttoptr i64 %t2957 to ptr
  call void @intrinsic_println(ptr %t2958)
  %t2959 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.371)
  %t2960 = ptrtoint ptr %t2959 to i64
  %t2961 = inttoptr i64 %t2960 to ptr
  call void @intrinsic_println(ptr %t2961)
  %t2962 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.372)
  %t2963 = ptrtoint ptr %t2962 to i64
  %t2964 = inttoptr i64 %t2963 to ptr
  call void @intrinsic_println(ptr %t2964)
  %t2965 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.373)
  %t2966 = ptrtoint ptr %t2965 to i64
  %t2967 = inttoptr i64 %t2966 to ptr
  call void @intrinsic_println(ptr %t2967)
  %t2968 = load i64, ptr %local.a01.2910
  %t2969 = load i64, ptr %local.a02.2911
  %t2970 = load i64, ptr %local.a03.2912
  %t2971 = load i64, ptr %local.a10.2913
  %t2972 = load i64, ptr %local.a12.2914
  %t2973 = load i64, ptr %local.a13.2915
  %t2974 = load i64, ptr %local.a20.2916
  %t2975 = load i64, ptr %local.a21.2917
  %t2976 = load i64, ptr %local.a23.2918
  %t2977 = load i64, ptr %local.a30.2919
  %t2978 = load i64, ptr %local.a31.2920
  %t2979 = load i64, ptr %local.a32.2921
  %t2980 = load i64, ptr %local.inner_steps.2927
  %t2981 = call i64 @"exp4_run_cycle"(i64 %t2968, i64 %t2969, i64 %t2970, i64 %t2971, i64 %t2972, i64 %t2973, i64 %t2974, i64 %t2975, i64 %t2976, i64 %t2977, i64 %t2978, i64 %t2979, i64 %t2980)
  store i64 %t2981, ptr %local.loss.2924
  %t2982 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.374)
  %t2983 = ptrtoint ptr %t2982 to i64
  %t2984 = inttoptr i64 %t2983 to ptr
  call void @intrinsic_print(ptr %t2984)
  %t2985 = load i64, ptr %local.loss.2924
  %t2986 = call i64 @"print_f64"(i64 %t2985)
  %t2987 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.375)
  %t2988 = ptrtoint ptr %t2987 to i64
  %t2989 = inttoptr i64 %t2988 to ptr
  call void @intrinsic_println(ptr %t2989)
  %t2990 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.376)
  %t2991 = ptrtoint ptr %t2990 to i64
  %t2992 = inttoptr i64 %t2991 to ptr
  call void @intrinsic_println(ptr %t2992)
  br label %loop67
loop67:
  %t2993 = load i64, ptr %local.cycle.2922
  %t2994 = load i64, ptr %local.meta_cycles.2928
  %t2995 = icmp slt i64 %t2993, %t2994
  %t2996 = zext i1 %t2995 to i64
  %t2997 = icmp ne i64 %t2996, 0
  br i1 %t2997, label %body67, label %endloop67
body67:
  store i64 0, ptr %local.w.2925
  br label %loop68
loop68:
  %t2998 = load i64, ptr %local.w.2925
  %t2999 = icmp slt i64 %t2998, 12
  %t3000 = zext i1 %t2999 to i64
  %t3001 = icmp ne i64 %t3000, 0
  br i1 %t3001, label %body68, label %endloop68
body68:
  %t3002 = load i64, ptr %local.a01.2910
  %t3003 = load i64, ptr %local.a02.2911
  %t3004 = load i64, ptr %local.a03.2912
  %t3005 = load i64, ptr %local.a10.2913
  %t3006 = load i64, ptr %local.a12.2914
  %t3007 = load i64, ptr %local.a13.2915
  %t3008 = load i64, ptr %local.a20.2916
  %t3009 = load i64, ptr %local.a21.2917
  %t3010 = load i64, ptr %local.a23.2918
  %t3011 = load i64, ptr %local.a30.2919
  %t3012 = load i64, ptr %local.a31.2920
  %t3013 = load i64, ptr %local.a32.2921
  %t3014 = load i64, ptr %local.w.2925
  %t3015 = load i64, ptr %local.inner_steps.2927
  %t3016 = call i64 @"exp4_meta_grad"(i64 %t3002, i64 %t3003, i64 %t3004, i64 %t3005, i64 %t3006, i64 %t3007, i64 %t3008, i64 %t3009, i64 %t3010, i64 %t3011, i64 %t3012, i64 %t3013, i64 %t3014, i64 %t3015)
  store i64 %t3016, ptr %local.mg.2923
  %t3017 = load i64, ptr %local.w.2925
  %t3018 = icmp eq i64 %t3017, 0
  %t3019 = zext i1 %t3018 to i64
  %t3020 = icmp ne i64 %t3019, 0
  br i1 %t3020, label %then69, label %else69
then69:
  %t3021 = load i64, ptr %local.a01.2910
  %t3022 = load i64, ptr %local.meta_lr.2926
  %t3023 = load i64, ptr %local.mg.2923
  %t3024 = call i64 @"sx_f64_mul"(i64 %t3022, i64 %t3023)
  %t3025 = call i64 @"sx_f64_sub"(i64 %t3021, i64 %t3024)
  %t3026 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.377)
  %t3027 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.378)
  %t3028 = call i64 @"clamp"(i64 %t3025, i64 %t3026, i64 %t3027)
  store i64 %t3028, ptr %local.a01.2910
  br label %then69_end
then69_end:
  br label %endif69
else69:
  br label %else69_end
else69_end:
  br label %endif69
endif69:
  %t3029 = phi i64 [ 0, %then69_end ], [ 0, %else69_end ]
  %t3030 = load i64, ptr %local.w.2925
  %t3031 = icmp eq i64 %t3030, 1
  %t3032 = zext i1 %t3031 to i64
  %t3033 = icmp ne i64 %t3032, 0
  br i1 %t3033, label %then70, label %else70
then70:
  %t3034 = load i64, ptr %local.a02.2911
  %t3035 = load i64, ptr %local.meta_lr.2926
  %t3036 = load i64, ptr %local.mg.2923
  %t3037 = call i64 @"sx_f64_mul"(i64 %t3035, i64 %t3036)
  %t3038 = call i64 @"sx_f64_sub"(i64 %t3034, i64 %t3037)
  %t3039 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.379)
  %t3040 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.380)
  %t3041 = call i64 @"clamp"(i64 %t3038, i64 %t3039, i64 %t3040)
  store i64 %t3041, ptr %local.a02.2911
  br label %then70_end
then70_end:
  br label %endif70
else70:
  br label %else70_end
else70_end:
  br label %endif70
endif70:
  %t3042 = phi i64 [ 0, %then70_end ], [ 0, %else70_end ]
  %t3043 = load i64, ptr %local.w.2925
  %t3044 = icmp eq i64 %t3043, 2
  %t3045 = zext i1 %t3044 to i64
  %t3046 = icmp ne i64 %t3045, 0
  br i1 %t3046, label %then71, label %else71
then71:
  %t3047 = load i64, ptr %local.a03.2912
  %t3048 = load i64, ptr %local.meta_lr.2926
  %t3049 = load i64, ptr %local.mg.2923
  %t3050 = call i64 @"sx_f64_mul"(i64 %t3048, i64 %t3049)
  %t3051 = call i64 @"sx_f64_sub"(i64 %t3047, i64 %t3050)
  %t3052 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.381)
  %t3053 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.382)
  %t3054 = call i64 @"clamp"(i64 %t3051, i64 %t3052, i64 %t3053)
  store i64 %t3054, ptr %local.a03.2912
  br label %then71_end
then71_end:
  br label %endif71
else71:
  br label %else71_end
else71_end:
  br label %endif71
endif71:
  %t3055 = phi i64 [ 0, %then71_end ], [ 0, %else71_end ]
  %t3056 = load i64, ptr %local.w.2925
  %t3057 = icmp eq i64 %t3056, 3
  %t3058 = zext i1 %t3057 to i64
  %t3059 = icmp ne i64 %t3058, 0
  br i1 %t3059, label %then72, label %else72
then72:
  %t3060 = load i64, ptr %local.a10.2913
  %t3061 = load i64, ptr %local.meta_lr.2926
  %t3062 = load i64, ptr %local.mg.2923
  %t3063 = call i64 @"sx_f64_mul"(i64 %t3061, i64 %t3062)
  %t3064 = call i64 @"sx_f64_sub"(i64 %t3060, i64 %t3063)
  %t3065 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.383)
  %t3066 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.384)
  %t3067 = call i64 @"clamp"(i64 %t3064, i64 %t3065, i64 %t3066)
  store i64 %t3067, ptr %local.a10.2913
  br label %then72_end
then72_end:
  br label %endif72
else72:
  br label %else72_end
else72_end:
  br label %endif72
endif72:
  %t3068 = phi i64 [ 0, %then72_end ], [ 0, %else72_end ]
  %t3069 = load i64, ptr %local.w.2925
  %t3070 = icmp eq i64 %t3069, 4
  %t3071 = zext i1 %t3070 to i64
  %t3072 = icmp ne i64 %t3071, 0
  br i1 %t3072, label %then73, label %else73
then73:
  %t3073 = load i64, ptr %local.a12.2914
  %t3074 = load i64, ptr %local.meta_lr.2926
  %t3075 = load i64, ptr %local.mg.2923
  %t3076 = call i64 @"sx_f64_mul"(i64 %t3074, i64 %t3075)
  %t3077 = call i64 @"sx_f64_sub"(i64 %t3073, i64 %t3076)
  %t3078 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.385)
  %t3079 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.386)
  %t3080 = call i64 @"clamp"(i64 %t3077, i64 %t3078, i64 %t3079)
  store i64 %t3080, ptr %local.a12.2914
  br label %then73_end
then73_end:
  br label %endif73
else73:
  br label %else73_end
else73_end:
  br label %endif73
endif73:
  %t3081 = phi i64 [ 0, %then73_end ], [ 0, %else73_end ]
  %t3082 = load i64, ptr %local.w.2925
  %t3083 = icmp eq i64 %t3082, 5
  %t3084 = zext i1 %t3083 to i64
  %t3085 = icmp ne i64 %t3084, 0
  br i1 %t3085, label %then74, label %else74
then74:
  %t3086 = load i64, ptr %local.a13.2915
  %t3087 = load i64, ptr %local.meta_lr.2926
  %t3088 = load i64, ptr %local.mg.2923
  %t3089 = call i64 @"sx_f64_mul"(i64 %t3087, i64 %t3088)
  %t3090 = call i64 @"sx_f64_sub"(i64 %t3086, i64 %t3089)
  %t3091 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.387)
  %t3092 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.388)
  %t3093 = call i64 @"clamp"(i64 %t3090, i64 %t3091, i64 %t3092)
  store i64 %t3093, ptr %local.a13.2915
  br label %then74_end
then74_end:
  br label %endif74
else74:
  br label %else74_end
else74_end:
  br label %endif74
endif74:
  %t3094 = phi i64 [ 0, %then74_end ], [ 0, %else74_end ]
  %t3095 = load i64, ptr %local.w.2925
  %t3096 = icmp eq i64 %t3095, 6
  %t3097 = zext i1 %t3096 to i64
  %t3098 = icmp ne i64 %t3097, 0
  br i1 %t3098, label %then75, label %else75
then75:
  %t3099 = load i64, ptr %local.a20.2916
  %t3100 = load i64, ptr %local.meta_lr.2926
  %t3101 = load i64, ptr %local.mg.2923
  %t3102 = call i64 @"sx_f64_mul"(i64 %t3100, i64 %t3101)
  %t3103 = call i64 @"sx_f64_sub"(i64 %t3099, i64 %t3102)
  %t3104 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.389)
  %t3105 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.390)
  %t3106 = call i64 @"clamp"(i64 %t3103, i64 %t3104, i64 %t3105)
  store i64 %t3106, ptr %local.a20.2916
  br label %then75_end
then75_end:
  br label %endif75
else75:
  br label %else75_end
else75_end:
  br label %endif75
endif75:
  %t3107 = phi i64 [ 0, %then75_end ], [ 0, %else75_end ]
  %t3108 = load i64, ptr %local.w.2925
  %t3109 = icmp eq i64 %t3108, 7
  %t3110 = zext i1 %t3109 to i64
  %t3111 = icmp ne i64 %t3110, 0
  br i1 %t3111, label %then76, label %else76
then76:
  %t3112 = load i64, ptr %local.a21.2917
  %t3113 = load i64, ptr %local.meta_lr.2926
  %t3114 = load i64, ptr %local.mg.2923
  %t3115 = call i64 @"sx_f64_mul"(i64 %t3113, i64 %t3114)
  %t3116 = call i64 @"sx_f64_sub"(i64 %t3112, i64 %t3115)
  %t3117 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.391)
  %t3118 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.392)
  %t3119 = call i64 @"clamp"(i64 %t3116, i64 %t3117, i64 %t3118)
  store i64 %t3119, ptr %local.a21.2917
  br label %then76_end
then76_end:
  br label %endif76
else76:
  br label %else76_end
else76_end:
  br label %endif76
endif76:
  %t3120 = phi i64 [ 0, %then76_end ], [ 0, %else76_end ]
  %t3121 = load i64, ptr %local.w.2925
  %t3122 = icmp eq i64 %t3121, 8
  %t3123 = zext i1 %t3122 to i64
  %t3124 = icmp ne i64 %t3123, 0
  br i1 %t3124, label %then77, label %else77
then77:
  %t3125 = load i64, ptr %local.a23.2918
  %t3126 = load i64, ptr %local.meta_lr.2926
  %t3127 = load i64, ptr %local.mg.2923
  %t3128 = call i64 @"sx_f64_mul"(i64 %t3126, i64 %t3127)
  %t3129 = call i64 @"sx_f64_sub"(i64 %t3125, i64 %t3128)
  %t3130 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.393)
  %t3131 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.394)
  %t3132 = call i64 @"clamp"(i64 %t3129, i64 %t3130, i64 %t3131)
  store i64 %t3132, ptr %local.a23.2918
  br label %then77_end
then77_end:
  br label %endif77
else77:
  br label %else77_end
else77_end:
  br label %endif77
endif77:
  %t3133 = phi i64 [ 0, %then77_end ], [ 0, %else77_end ]
  %t3134 = load i64, ptr %local.w.2925
  %t3135 = icmp eq i64 %t3134, 9
  %t3136 = zext i1 %t3135 to i64
  %t3137 = icmp ne i64 %t3136, 0
  br i1 %t3137, label %then78, label %else78
then78:
  %t3138 = load i64, ptr %local.a30.2919
  %t3139 = load i64, ptr %local.meta_lr.2926
  %t3140 = load i64, ptr %local.mg.2923
  %t3141 = call i64 @"sx_f64_mul"(i64 %t3139, i64 %t3140)
  %t3142 = call i64 @"sx_f64_sub"(i64 %t3138, i64 %t3141)
  %t3143 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.395)
  %t3144 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.396)
  %t3145 = call i64 @"clamp"(i64 %t3142, i64 %t3143, i64 %t3144)
  store i64 %t3145, ptr %local.a30.2919
  br label %then78_end
then78_end:
  br label %endif78
else78:
  br label %else78_end
else78_end:
  br label %endif78
endif78:
  %t3146 = phi i64 [ 0, %then78_end ], [ 0, %else78_end ]
  %t3147 = load i64, ptr %local.w.2925
  %t3148 = icmp eq i64 %t3147, 10
  %t3149 = zext i1 %t3148 to i64
  %t3150 = icmp ne i64 %t3149, 0
  br i1 %t3150, label %then79, label %else79
then79:
  %t3151 = load i64, ptr %local.a31.2920
  %t3152 = load i64, ptr %local.meta_lr.2926
  %t3153 = load i64, ptr %local.mg.2923
  %t3154 = call i64 @"sx_f64_mul"(i64 %t3152, i64 %t3153)
  %t3155 = call i64 @"sx_f64_sub"(i64 %t3151, i64 %t3154)
  %t3156 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.397)
  %t3157 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.398)
  %t3158 = call i64 @"clamp"(i64 %t3155, i64 %t3156, i64 %t3157)
  store i64 %t3158, ptr %local.a31.2920
  br label %then79_end
then79_end:
  br label %endif79
else79:
  br label %else79_end
else79_end:
  br label %endif79
endif79:
  %t3159 = phi i64 [ 0, %then79_end ], [ 0, %else79_end ]
  %t3160 = load i64, ptr %local.w.2925
  %t3161 = icmp eq i64 %t3160, 11
  %t3162 = zext i1 %t3161 to i64
  %t3163 = icmp ne i64 %t3162, 0
  br i1 %t3163, label %then80, label %else80
then80:
  %t3164 = load i64, ptr %local.a32.2921
  %t3165 = load i64, ptr %local.meta_lr.2926
  %t3166 = load i64, ptr %local.mg.2923
  %t3167 = call i64 @"sx_f64_mul"(i64 %t3165, i64 %t3166)
  %t3168 = call i64 @"sx_f64_sub"(i64 %t3164, i64 %t3167)
  %t3169 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.399)
  %t3170 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.400)
  %t3171 = call i64 @"clamp"(i64 %t3168, i64 %t3169, i64 %t3170)
  store i64 %t3171, ptr %local.a32.2921
  br label %then80_end
then80_end:
  br label %endif80
else80:
  br label %else80_end
else80_end:
  br label %endif80
endif80:
  %t3172 = phi i64 [ 0, %then80_end ], [ 0, %else80_end ]
  %t3173 = load i64, ptr %local.w.2925
  %t3174 = add i64 %t3173, 1
  store i64 %t3174, ptr %local.w.2925
  br label %loop68
endloop68:
  %t3175 = load i64, ptr %local.a01.2910
  %t3176 = load i64, ptr %local.a02.2911
  %t3177 = load i64, ptr %local.a03.2912
  %t3178 = load i64, ptr %local.a10.2913
  %t3179 = load i64, ptr %local.a12.2914
  %t3180 = load i64, ptr %local.a13.2915
  %t3181 = load i64, ptr %local.a20.2916
  %t3182 = load i64, ptr %local.a21.2917
  %t3183 = load i64, ptr %local.a23.2918
  %t3184 = load i64, ptr %local.a30.2919
  %t3185 = load i64, ptr %local.a31.2920
  %t3186 = load i64, ptr %local.a32.2921
  %t3187 = load i64, ptr %local.inner_steps.2927
  %t3188 = call i64 @"exp4_run_cycle"(i64 %t3175, i64 %t3176, i64 %t3177, i64 %t3178, i64 %t3179, i64 %t3180, i64 %t3181, i64 %t3182, i64 %t3183, i64 %t3184, i64 %t3185, i64 %t3186, i64 %t3187)
  store i64 %t3188, ptr %local.loss.2924
  %t3189 = load i64, ptr %local.cycle.2922
  %t3190 = icmp slt i64 %t3189, 3
  %t3191 = zext i1 %t3190 to i64
  %t3192 = icmp ne i64 %t3191, 0
  br i1 %t3192, label %then81, label %else81
then81:
  %t3193 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.401)
  %t3194 = ptrtoint ptr %t3193 to i64
  %t3195 = inttoptr i64 %t3194 to ptr
  call void @intrinsic_print(ptr %t3195)
  %t3196 = load i64, ptr %local.cycle.2922
  call void @print_i64(i64 %t3196)
  %t3197 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.402)
  %t3198 = ptrtoint ptr %t3197 to i64
  %t3199 = inttoptr i64 %t3198 to ptr
  call void @intrinsic_print(ptr %t3199)
  %t3200 = load i64, ptr %local.loss.2924
  %t3201 = call i64 @"print_f64"(i64 %t3200)
  %t3202 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.403)
  %t3203 = ptrtoint ptr %t3202 to i64
  %t3204 = inttoptr i64 %t3203 to ptr
  call void @intrinsic_println(ptr %t3204)
  br label %then81_end
then81_end:
  br label %endif81
else81:
  br label %else81_end
else81_end:
  br label %endif81
endif81:
  %t3205 = phi i64 [ 0, %then81_end ], [ 0, %else81_end ]
  %t3206 = load i64, ptr %local.cycle.2922
  %t3207 = icmp eq i64 %t3206, 19
  %t3208 = zext i1 %t3207 to i64
  %t3209 = icmp ne i64 %t3208, 0
  br i1 %t3209, label %then82, label %else82
then82:
  %t3210 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.404)
  %t3211 = ptrtoint ptr %t3210 to i64
  %t3212 = inttoptr i64 %t3211 to ptr
  call void @intrinsic_print(ptr %t3212)
  %t3213 = load i64, ptr %local.loss.2924
  %t3214 = call i64 @"print_f64"(i64 %t3213)
  %t3215 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.405)
  %t3216 = ptrtoint ptr %t3215 to i64
  %t3217 = inttoptr i64 %t3216 to ptr
  call void @intrinsic_println(ptr %t3217)
  br label %then82_end
then82_end:
  br label %endif82
else82:
  br label %else82_end
else82_end:
  br label %endif82
endif82:
  %t3218 = phi i64 [ 0, %then82_end ], [ 0, %else82_end ]
  %t3219 = load i64, ptr %local.cycle.2922
  %t3220 = icmp eq i64 %t3219, 39
  %t3221 = zext i1 %t3220 to i64
  %t3222 = icmp ne i64 %t3221, 0
  br i1 %t3222, label %then83, label %else83
then83:
  %t3223 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.406)
  %t3224 = ptrtoint ptr %t3223 to i64
  %t3225 = inttoptr i64 %t3224 to ptr
  call void @intrinsic_print(ptr %t3225)
  %t3226 = load i64, ptr %local.loss.2924
  %t3227 = call i64 @"print_f64"(i64 %t3226)
  %t3228 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.407)
  %t3229 = ptrtoint ptr %t3228 to i64
  %t3230 = inttoptr i64 %t3229 to ptr
  call void @intrinsic_println(ptr %t3230)
  br label %then83_end
then83_end:
  br label %endif83
else83:
  br label %else83_end
else83_end:
  br label %endif83
endif83:
  %t3231 = phi i64 [ 0, %then83_end ], [ 0, %else83_end ]
  %t3232 = load i64, ptr %local.cycle.2922
  %t3233 = add i64 %t3232, 1
  store i64 %t3233, ptr %local.cycle.2922
  br label %loop67
endloop67:
  %t3234 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.408)
  %t3235 = ptrtoint ptr %t3234 to i64
  %t3236 = inttoptr i64 %t3235 to ptr
  call void @intrinsic_println(ptr %t3236)
  %t3237 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.409)
  %t3238 = ptrtoint ptr %t3237 to i64
  %t3239 = inttoptr i64 %t3238 to ptr
  call void @intrinsic_println(ptr %t3239)
  %t3240 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.410)
  %t3241 = ptrtoint ptr %t3240 to i64
  %t3242 = inttoptr i64 %t3241 to ptr
  call void @intrinsic_println(ptr %t3242)
  %t3243 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.411)
  %t3244 = ptrtoint ptr %t3243 to i64
  %t3245 = inttoptr i64 %t3244 to ptr
  call void @intrinsic_println(ptr %t3245)
  %t3246 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.412)
  %t3247 = ptrtoint ptr %t3246 to i64
  %t3248 = inttoptr i64 %t3247 to ptr
  call void @intrinsic_print(ptr %t3248)
  %t3249 = load i64, ptr %local.a01.2910
  %t3250 = call i64 @"print_f64"(i64 %t3249)
  %t3251 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.413)
  %t3252 = ptrtoint ptr %t3251 to i64
  %t3253 = inttoptr i64 %t3252 to ptr
  call void @intrinsic_print(ptr %t3253)
  %t3254 = load i64, ptr %local.a02.2911
  %t3255 = call i64 @"print_f64"(i64 %t3254)
  %t3256 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.414)
  %t3257 = ptrtoint ptr %t3256 to i64
  %t3258 = inttoptr i64 %t3257 to ptr
  call void @intrinsic_print(ptr %t3258)
  %t3259 = load i64, ptr %local.a03.2912
  %t3260 = call i64 @"print_f64"(i64 %t3259)
  %t3261 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.415)
  %t3262 = ptrtoint ptr %t3261 to i64
  %t3263 = inttoptr i64 %t3262 to ptr
  call void @intrinsic_println(ptr %t3263)
  %t3264 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.416)
  %t3265 = ptrtoint ptr %t3264 to i64
  %t3266 = inttoptr i64 %t3265 to ptr
  call void @intrinsic_print(ptr %t3266)
  %t3267 = load i64, ptr %local.a10.2913
  %t3268 = call i64 @"print_f64"(i64 %t3267)
  %t3269 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.417)
  %t3270 = ptrtoint ptr %t3269 to i64
  %t3271 = inttoptr i64 %t3270 to ptr
  call void @intrinsic_print(ptr %t3271)
  %t3272 = load i64, ptr %local.a12.2914
  %t3273 = call i64 @"print_f64"(i64 %t3272)
  %t3274 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.418)
  %t3275 = ptrtoint ptr %t3274 to i64
  %t3276 = inttoptr i64 %t3275 to ptr
  call void @intrinsic_print(ptr %t3276)
  %t3277 = load i64, ptr %local.a13.2915
  %t3278 = call i64 @"print_f64"(i64 %t3277)
  %t3279 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.419)
  %t3280 = ptrtoint ptr %t3279 to i64
  %t3281 = inttoptr i64 %t3280 to ptr
  call void @intrinsic_println(ptr %t3281)
  %t3282 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.420)
  %t3283 = ptrtoint ptr %t3282 to i64
  %t3284 = inttoptr i64 %t3283 to ptr
  call void @intrinsic_print(ptr %t3284)
  %t3285 = load i64, ptr %local.a20.2916
  %t3286 = call i64 @"print_f64"(i64 %t3285)
  %t3287 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.421)
  %t3288 = ptrtoint ptr %t3287 to i64
  %t3289 = inttoptr i64 %t3288 to ptr
  call void @intrinsic_print(ptr %t3289)
  %t3290 = load i64, ptr %local.a21.2917
  %t3291 = call i64 @"print_f64"(i64 %t3290)
  %t3292 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.422)
  %t3293 = ptrtoint ptr %t3292 to i64
  %t3294 = inttoptr i64 %t3293 to ptr
  call void @intrinsic_print(ptr %t3294)
  %t3295 = load i64, ptr %local.a23.2918
  %t3296 = call i64 @"print_f64"(i64 %t3295)
  %t3297 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.423)
  %t3298 = ptrtoint ptr %t3297 to i64
  %t3299 = inttoptr i64 %t3298 to ptr
  call void @intrinsic_println(ptr %t3299)
  %t3300 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.424)
  %t3301 = ptrtoint ptr %t3300 to i64
  %t3302 = inttoptr i64 %t3301 to ptr
  call void @intrinsic_print(ptr %t3302)
  %t3303 = load i64, ptr %local.a30.2919
  %t3304 = call i64 @"print_f64"(i64 %t3303)
  %t3305 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.425)
  %t3306 = ptrtoint ptr %t3305 to i64
  %t3307 = inttoptr i64 %t3306 to ptr
  call void @intrinsic_print(ptr %t3307)
  %t3308 = load i64, ptr %local.a31.2920
  %t3309 = call i64 @"print_f64"(i64 %t3308)
  %t3310 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.426)
  %t3311 = ptrtoint ptr %t3310 to i64
  %t3312 = inttoptr i64 %t3311 to ptr
  call void @intrinsic_print(ptr %t3312)
  %t3313 = load i64, ptr %local.a32.2921
  %t3314 = call i64 @"print_f64"(i64 %t3313)
  %t3315 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.427)
  %t3316 = ptrtoint ptr %t3315 to i64
  %t3317 = inttoptr i64 %t3316 to ptr
  call void @intrinsic_println(ptr %t3317)
  %t3318 = load i64, ptr %local.a01.2910
  %t3319 = load i64, ptr %local.a10.2913
  %t3320 = call i64 @"sx_f64_add"(i64 %t3318, i64 %t3319)
  %t3321 = load i64, ptr %local.a23.2918
  %t3322 = call i64 @"sx_f64_add"(i64 %t3320, i64 %t3321)
  %t3323 = load i64, ptr %local.a32.2921
  %t3324 = call i64 @"sx_f64_add"(i64 %t3322, i64 %t3323)
  %t3325 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.428)
  %t3326 = call i64 @"sx_f64_div"(i64 %t3324, i64 %t3325)
  store i64 %t3326, ptr %local.within_avg.2929
  %t3327 = load i64, ptr %local.a02.2911
  %t3328 = load i64, ptr %local.a03.2912
  %t3329 = call i64 @"sx_f64_add"(i64 %t3327, i64 %t3328)
  %t3330 = load i64, ptr %local.a12.2914
  %t3331 = call i64 @"sx_f64_add"(i64 %t3329, i64 %t3330)
  %t3332 = load i64, ptr %local.a13.2915
  %t3333 = call i64 @"sx_f64_add"(i64 %t3331, i64 %t3332)
  %t3334 = load i64, ptr %local.a20.2916
  %t3335 = call i64 @"sx_f64_add"(i64 %t3333, i64 %t3334)
  %t3336 = load i64, ptr %local.a21.2917
  %t3337 = call i64 @"sx_f64_add"(i64 %t3335, i64 %t3336)
  %t3338 = load i64, ptr %local.a30.2919
  %t3339 = call i64 @"sx_f64_add"(i64 %t3337, i64 %t3338)
  %t3340 = load i64, ptr %local.a31.2920
  %t3341 = call i64 @"sx_f64_add"(i64 %t3339, i64 %t3340)
  %t3342 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.429)
  %t3343 = call i64 @"sx_f64_div"(i64 %t3341, i64 %t3342)
  store i64 %t3343, ptr %local.between_avg.2930
  %t3344 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.430)
  %t3345 = ptrtoint ptr %t3344 to i64
  %t3346 = inttoptr i64 %t3345 to ptr
  call void @intrinsic_println(ptr %t3346)
  %t3347 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.431)
  %t3348 = ptrtoint ptr %t3347 to i64
  %t3349 = inttoptr i64 %t3348 to ptr
  call void @intrinsic_print(ptr %t3349)
  %t3350 = load i64, ptr %local.within_avg.2929
  %t3351 = call i64 @"print_f64"(i64 %t3350)
  %t3352 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.432)
  %t3353 = ptrtoint ptr %t3352 to i64
  %t3354 = inttoptr i64 %t3353 to ptr
  call void @intrinsic_println(ptr %t3354)
  %t3355 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.433)
  %t3356 = ptrtoint ptr %t3355 to i64
  %t3357 = inttoptr i64 %t3356 to ptr
  call void @intrinsic_print(ptr %t3357)
  %t3358 = load i64, ptr %local.between_avg.2930
  %t3359 = call i64 @"print_f64"(i64 %t3358)
  %t3360 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.434)
  %t3361 = ptrtoint ptr %t3360 to i64
  %t3362 = inttoptr i64 %t3361 to ptr
  call void @intrinsic_println(ptr %t3362)
  %t3363 = load i64, ptr %local.between_avg.2930
  %t3364 = load i64, ptr %local.within_avg.2929
  %t3365 = call i64 @"sx_f64_sub"(i64 %t3363, i64 %t3364)
  store i64 %t3365, ptr %local.gap.2931
  %t3366 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.435)
  %t3367 = ptrtoint ptr %t3366 to i64
  %t3368 = inttoptr i64 %t3367 to ptr
  call void @intrinsic_print(ptr %t3368)
  %t3369 = load i64, ptr %local.gap.2931
  %t3370 = call i64 @"print_f64"(i64 %t3369)
  %t3371 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.436)
  %t3372 = ptrtoint ptr %t3371 to i64
  %t3373 = inttoptr i64 %t3372 to ptr
  call void @intrinsic_println(ptr %t3373)
  %t3374 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.437)
  %t3375 = ptrtoint ptr %t3374 to i64
  %t3376 = inttoptr i64 %t3375 to ptr
  call void @intrinsic_println(ptr %t3376)
  %t3377 = load i64, ptr %local.gap.2931
  %t3378 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.438)
  %t3379 = call i64 @"sx_f64_gt"(i64 %t3377, i64 %t3378)
  %t3380 = icmp ne i64 %t3379, 0
  br i1 %t3380, label %then84, label %else84
then84:
  %t3381 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.439)
  %t3382 = ptrtoint ptr %t3381 to i64
  %t3383 = inttoptr i64 %t3382 to ptr
  call void @intrinsic_println(ptr %t3383)
  %t3384 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.440)
  %t3385 = ptrtoint ptr %t3384 to i64
  %t3386 = inttoptr i64 %t3385 to ptr
  call void @intrinsic_println(ptr %t3386)
  %t3387 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.441)
  %t3388 = ptrtoint ptr %t3387 to i64
  %t3389 = inttoptr i64 %t3388 to ptr
  call void @intrinsic_println(ptr %t3389)
  br label %then84_end
then84_end:
  br label %endif84
else84:
  %t3390 = load i64, ptr %local.gap.2931
  %t3391 = call i64 @f64_parse(ptr @.str.exp_symmetry_breaking.442)
  %t3392 = call i64 @"sx_f64_gt"(i64 %t3390, i64 %t3391)
  %t3393 = icmp ne i64 %t3392, 0
  br i1 %t3393, label %then85, label %else85
then85:
  %t3394 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.443)
  %t3395 = ptrtoint ptr %t3394 to i64
  %t3396 = inttoptr i64 %t3395 to ptr
  call void @intrinsic_println(ptr %t3396)
  %t3397 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.444)
  %t3398 = ptrtoint ptr %t3397 to i64
  %t3399 = inttoptr i64 %t3398 to ptr
  call void @intrinsic_println(ptr %t3399)
  br label %then85_end
then85_end:
  br label %endif85
else85:
  %t3400 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.445)
  %t3401 = ptrtoint ptr %t3400 to i64
  %t3402 = inttoptr i64 %t3401 to ptr
  call void @intrinsic_println(ptr %t3402)
  br label %else85_end
else85_end:
  br label %endif85
endif85:
  %t3403 = phi i64 [ 0, %then85_end ], [ 0, %else85_end ]
  br label %else84_end
else84_end:
  br label %endif84
endif84:
  %t3404 = phi i64 [ 0, %then84_end ], [ %t3403, %else84_end ]
  %t3405 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.446)
  %t3406 = ptrtoint ptr %t3405 to i64
  %t3407 = inttoptr i64 %t3406 to ptr
  call void @intrinsic_println(ptr %t3407)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t3408 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.447)
  %t3409 = ptrtoint ptr %t3408 to i64
  %t3410 = inttoptr i64 %t3409 to ptr
  call void @intrinsic_println(ptr %t3410)
  %t3411 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.448)
  %t3412 = ptrtoint ptr %t3411 to i64
  %t3413 = inttoptr i64 %t3412 to ptr
  call void @intrinsic_println(ptr %t3413)
  %t3414 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.449)
  %t3415 = ptrtoint ptr %t3414 to i64
  %t3416 = inttoptr i64 %t3415 to ptr
  call void @intrinsic_println(ptr %t3416)
  %t3417 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.450)
  %t3418 = ptrtoint ptr %t3417 to i64
  %t3419 = inttoptr i64 %t3418 to ptr
  call void @intrinsic_println(ptr %t3419)
  %t3420 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.451)
  %t3421 = ptrtoint ptr %t3420 to i64
  %t3422 = inttoptr i64 %t3421 to ptr
  call void @intrinsic_println(ptr %t3422)
  %t3423 = call i64 @"run_exp1"()
  %t3424 = call i64 @"run_exp2"()
  %t3425 = call i64 @"run_exp3"()
  %t3426 = call i64 @"run_exp4"()
  %t3427 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.452)
  %t3428 = ptrtoint ptr %t3427 to i64
  %t3429 = inttoptr i64 %t3428 to ptr
  call void @intrinsic_println(ptr %t3429)
  %t3430 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.453)
  %t3431 = ptrtoint ptr %t3430 to i64
  %t3432 = inttoptr i64 %t3431 to ptr
  call void @intrinsic_println(ptr %t3432)
  %t3433 = call ptr @intrinsic_string_new(ptr @.str.exp_symmetry_breaking.454)
  %t3434 = ptrtoint ptr %t3433 to i64
  %t3435 = inttoptr i64 %t3434 to ptr
  call void @intrinsic_println(ptr %t3435)
  ret i64 0
}


; String constants
@.str.exp_symmetry_breaking.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.2 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_symmetry_breaking.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.5 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_symmetry_breaking.6 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.19 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.35 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_symmetry_breaking.36 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.37 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.40 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.41 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.42 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.43 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.45 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.46 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.47 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.48 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.49 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.51 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.53 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.54 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.55 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.58 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.60 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_symmetry_breaking.61 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.62 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.63 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.64 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.65 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.66 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.67 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.68 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.69 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.70 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.71 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.72 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.73 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.74 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.76 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.78 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.79 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.80 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_symmetry_breaking.81 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_symmetry_breaking.82 = private unnamed_addr constant [52 x i8] c"  EXP 1: SYMMETRIC OBJECTIVES -> ASYMMETRIC MATRIX?\00"
@.str.exp_symmetry_breaking.83 = private unnamed_addr constant [47 x i8] c"  Targets: A=[3,0,0,0] B=[0,3,0,0] C=[0,0,3,0]\00"
@.str.exp_symmetry_breaking.84 = private unnamed_addr constant [56 x i8] c"  All pairs have identical conflict angle (orthogonal).\00"
@.str.exp_symmetry_breaking.85 = private unnamed_addr constant [44 x i8] c"  60 meta-cycles, lr=0.005, 200 inner steps\00"
@.str.exp_symmetry_breaking.86 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_symmetry_breaking.87 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.88 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.89 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.90 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.91 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.92 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.93 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.94 = private unnamed_addr constant [33 x i8] c"  Initial loss (all alpha=0.5): \00"
@.str.exp_symmetry_breaking.95 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.96 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.97 = private unnamed_addr constant [69 x i8] c"  Cycle  Loss       Drift      ab     ac     ba     bc     ca     cb\00"
@.str.exp_symmetry_breaking.98 = private unnamed_addr constant [72 x i8] c"  -----  ---------  ---------  -----  -----  -----  -----  -----  -----\00"
@.str.exp_symmetry_breaking.99 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.100 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.101 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.102 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.103 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.104 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.105 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.106 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.107 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.108 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.109 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.110 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.111 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.112 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_symmetry_breaking.113 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.114 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.115 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.116 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.117 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.118 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.119 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.120 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.121 = private unnamed_addr constant [10 x i8] c"  29     \00"
@.str.exp_symmetry_breaking.122 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.123 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.124 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.125 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.126 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.127 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.128 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.129 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.130 = private unnamed_addr constant [10 x i8] c"  59     \00"
@.str.exp_symmetry_breaking.131 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.132 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.133 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.134 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.135 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.136 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.137 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.138 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.139 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.140 = private unnamed_addr constant [32 x i8] c"  Final 3x3 Interaction Matrix:\00"
@.str.exp_symmetry_breaking.141 = private unnamed_addr constant [32 x i8] c"          ->A      ->B      ->C\00"
@.str.exp_symmetry_breaking.142 = private unnamed_addr constant [16 x i8] c"  A:  [  ---   \00"
@.str.exp_symmetry_breaking.143 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.144 = private unnamed_addr constant [4 x i8] c"  ]\00"
@.str.exp_symmetry_breaking.145 = private unnamed_addr constant [10 x i8] c"  B:  [  \00"
@.str.exp_symmetry_breaking.146 = private unnamed_addr constant [9 x i8] c"  ---   \00"
@.str.exp_symmetry_breaking.147 = private unnamed_addr constant [4 x i8] c"  ]\00"
@.str.exp_symmetry_breaking.148 = private unnamed_addr constant [10 x i8] c"  C:  [  \00"
@.str.exp_symmetry_breaking.149 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.150 = private unnamed_addr constant [10 x i8] c"  ---   ]\00"
@.str.exp_symmetry_breaking.151 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.152 = private unnamed_addr constant [30 x i8] c"  Asymmetry score (max-min): \00"
@.str.exp_symmetry_breaking.153 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.154 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_symmetry_breaking.155 = private unnamed_addr constant [61 x i8] c"  RESULT: Symmetry BROKEN - sequential meta-gradient updates\00"
@.str.exp_symmetry_breaking.156 = private unnamed_addr constant [49 x i8] c"  break the symmetric arrangement of objectives.\00"
@.str.exp_symmetry_breaking.157 = private unnamed_addr constant [55 x i8] c"  RESULT: Symmetry PRESERVED - matrix remains uniform.\00"
@.str.exp_symmetry_breaking.158 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.159 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.160 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.162 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.163 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.164 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.165 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.166 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.167 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.168 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.169 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.170 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.171 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.172 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.173 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.174 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.175 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.176 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.177 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.178 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.179 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.180 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.181 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.182 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.183 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.184 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.185 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_symmetry_breaking.186 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.187 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.188 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.189 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.190 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_symmetry_breaking.191 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_symmetry_breaking.192 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.193 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.194 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.195 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.196 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.197 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.198 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_symmetry_breaking.199 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.200 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.201 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_symmetry_breaking.202 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.203 = private unnamed_addr constant [5 x i8] c"  K=\00"
@.str.exp_symmetry_breaking.204 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_symmetry_breaking.205 = private unnamed_addr constant [10 x i8] c"  loss/K=\00"
@.str.exp_symmetry_breaking.206 = private unnamed_addr constant [9 x i8] c"  alpha=\00"
@.str.exp_symmetry_breaking.207 = private unnamed_addr constant [19 x i8] c"  converged@cycle=\00"
@.str.exp_symmetry_breaking.208 = private unnamed_addr constant [24 x i8] c"  NOT CONVERGED (drift=\00"
@.str.exp_symmetry_breaking.209 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_symmetry_breaking.210 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.211 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_symmetry_breaking.212 = private unnamed_addr constant [53 x i8] c"  EXP 2: CRITICAL COMPONENT COUNT (PHASE TRANSITION)\00"
@.str.exp_symmetry_breaking.213 = private unnamed_addr constant [47 x i8] c"  K objectives, target_i[d]=3 if d==i%4 else 0\00"
@.str.exp_symmetry_breaking.214 = private unnamed_addr constant [50 x i8] c"  40 meta-cycles per K, lr=0.005, 200 inner steps\00"
@.str.exp_symmetry_breaking.215 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_symmetry_breaking.216 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.217 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.218 = private unnamed_addr constant [34 x i8] c"  PHASE TRANSITION detected at K=\00"
@.str.exp_symmetry_breaking.219 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.220 = private unnamed_addr constant [56 x i8] c"  System transitions from converging to non-converging.\00"
@.str.exp_symmetry_breaking.221 = private unnamed_addr constant [54 x i8] c"  No sharp phase transition detected in K=2..8 range.\00"
@.str.exp_symmetry_breaking.222 = private unnamed_addr constant [53 x i8] c"  System may degrade gradually rather than abruptly.\00"
@.str.exp_symmetry_breaking.223 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.224 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.225 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.226 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.227 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.228 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.229 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.230 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.231 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.232 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.233 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_symmetry_breaking.234 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.235 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.236 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.237 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.238 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.239 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.240 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.241 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.242 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.243 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.244 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.245 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.246 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.247 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.248 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_symmetry_breaking.249 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.250 = private unnamed_addr constant [12 x i8] c"  perturb=+\00"
@.str.exp_symmetry_breaking.251 = private unnamed_addr constant [14 x i8] c"  initial_ab=\00"
@.str.exp_symmetry_breaking.252 = private unnamed_addr constant [12 x i8] c"  final_ab=\00"
@.str.exp_symmetry_breaking.253 = private unnamed_addr constant [16 x i8] c"  dist_from_eq=\00"
@.str.exp_symmetry_breaking.254 = private unnamed_addr constant [19 x i8] c"  recovered@cycle=\00"
@.str.exp_symmetry_breaking.255 = private unnamed_addr constant [16 x i8] c"  NOT recovered\00"
@.str.exp_symmetry_breaking.256 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.257 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_symmetry_breaking.258 = private unnamed_addr constant [57 x i8] c"  EXP 3: PERTURBATION SENSITIVITY (STRUCTURAL STABILITY)\00"
@.str.exp_symmetry_breaking.259 = private unnamed_addr constant [47 x i8] c"  Start from converged matrix (all alpha=1.0).\00"
@.str.exp_symmetry_breaking.260 = private unnamed_addr constant [56 x i8] c"  Perturb alpha_ab, track recovery over 40 meta-cycles.\00"
@.str.exp_symmetry_breaking.261 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_symmetry_breaking.262 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.263 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_symmetry_breaking.264 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.265 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_symmetry_breaking.266 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.267 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.268 = private unnamed_addr constant [45 x i8] c"  RESULT: Fixed point is a STRONG ATTRACTOR.\00"
@.str.exp_symmetry_breaking.269 = private unnamed_addr constant [54 x i8] c"  All perturbations recovered -> structurally stable.\00"
@.str.exp_symmetry_breaking.270 = private unnamed_addr constant [55 x i8] c"  RESULT: Fixed point has LIMITED basin of attraction.\00"
@.str.exp_symmetry_breaking.271 = private unnamed_addr constant [56 x i8] c"  Large perturbations escape -> structural instability.\00"
@.str.exp_symmetry_breaking.272 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.273 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.274 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.275 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.276 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.277 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.278 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.279 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.280 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.281 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.282 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.283 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.284 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.285 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.286 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.287 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.288 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.289 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.290 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.291 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.292 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.293 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.294 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.295 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.296 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.297 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.298 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.299 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.300 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.301 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.302 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.303 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.304 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.305 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.306 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.307 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.308 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.309 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_symmetry_breaking.310 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.311 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.312 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.313 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.314 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_symmetry_breaking.315 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.316 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.317 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.318 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.319 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.320 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.321 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.322 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.323 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.324 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.325 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.326 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.327 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_symmetry_breaking.328 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.329 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.330 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.331 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.332 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.333 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.334 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_symmetry_breaking.335 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.336 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.337 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.338 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.339 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.340 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.341 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_symmetry_breaking.342 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.343 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.344 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.345 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.346 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.347 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_symmetry_breaking.348 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.349 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.350 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_symmetry_breaking.351 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.352 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.353 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.354 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.355 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.356 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.357 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.358 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.359 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.360 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.361 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.362 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.363 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_symmetry_breaking.364 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.365 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.366 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_symmetry_breaking.367 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_symmetry_breaking.368 = private unnamed_addr constant [49 x i8] c"  EXP 4: COMPETING HIERARCHIES (GROUP STRUCTURE)\00"
@.str.exp_symmetry_breaking.369 = private unnamed_addr constant [49 x i8] c"  Group 1: [3,3,0,0] and [4,2,0,0] (cooperative)\00"
@.str.exp_symmetry_breaking.370 = private unnamed_addr constant [53 x i8] c"  Group 2: [-3,-3,0,0] and [-2,-4,0,0] (cooperative)\00"
@.str.exp_symmetry_breaking.371 = private unnamed_addr constant [53 x i8] c"  Groups are adversarial. 12 alphas, 40 meta-cycles.\00"
@.str.exp_symmetry_breaking.372 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_symmetry_breaking.373 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.374 = private unnamed_addr constant [17 x i8] c"  Initial loss: \00"
@.str.exp_symmetry_breaking.375 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.376 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.377 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.378 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.379 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.380 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.381 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.382 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.383 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.384 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.385 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.386 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.387 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.388 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.389 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.390 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.391 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.392 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.393 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.394 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.395 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.396 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.397 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.398 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.399 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.400 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_symmetry_breaking.401 = private unnamed_addr constant [9 x i8] c"  cycle \00"
@.str.exp_symmetry_breaking.402 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_symmetry_breaking.403 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.404 = private unnamed_addr constant [18 x i8] c"  cycle 19  loss=\00"
@.str.exp_symmetry_breaking.405 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.406 = private unnamed_addr constant [18 x i8] c"  cycle 39  loss=\00"
@.str.exp_symmetry_breaking.407 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.408 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.409 = private unnamed_addr constant [34 x i8] c"  Learned 4x4 Interaction Matrix:\00"
@.str.exp_symmetry_breaking.410 = private unnamed_addr constant [42 x i8] c"          Obj0     Obj1     Obj2     Obj3\00"
@.str.exp_symmetry_breaking.411 = private unnamed_addr constant [42 x i8] c"         (G1a)    (G1b)    (G2a)    (G2b)\00"
@.str.exp_symmetry_breaking.412 = private unnamed_addr constant [19 x i8] c"  Obj0:  ---      \00"
@.str.exp_symmetry_breaking.413 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.414 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.415 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.416 = private unnamed_addr constant [10 x i8] c"  Obj1:  \00"
@.str.exp_symmetry_breaking.417 = private unnamed_addr constant [12 x i8] c"  ---      \00"
@.str.exp_symmetry_breaking.418 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.419 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.420 = private unnamed_addr constant [10 x i8] c"  Obj2:  \00"
@.str.exp_symmetry_breaking.421 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.422 = private unnamed_addr constant [12 x i8] c"  ---      \00"
@.str.exp_symmetry_breaking.423 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.424 = private unnamed_addr constant [10 x i8] c"  Obj3:  \00"
@.str.exp_symmetry_breaking.425 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.426 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_symmetry_breaking.427 = private unnamed_addr constant [6 x i8] c"  ---\00"
@.str.exp_symmetry_breaking.428 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_symmetry_breaking.429 = private unnamed_addr constant [4 x i8] c"8.0\00"
@.str.exp_symmetry_breaking.430 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.431 = private unnamed_addr constant [28 x i8] c"  Within-group avg alpha:  \00"
@.str.exp_symmetry_breaking.432 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.433 = private unnamed_addr constant [28 x i8] c"  Between-group avg alpha: \00"
@.str.exp_symmetry_breaking.434 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.435 = private unnamed_addr constant [28 x i8] c"  Gap (between - within):  \00"
@.str.exp_symmetry_breaking.436 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.437 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.438 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_symmetry_breaking.439 = private unnamed_addr constant [38 x i8] c"  RESULT: Group structure DISCOVERED.\00"
@.str.exp_symmetry_breaking.440 = private unnamed_addr constant [71 x i8] c"  Higher alpha between groups (adversarial) than within (cooperative).\00"
@.str.exp_symmetry_breaking.441 = private unnamed_addr constant [57 x i8] c"  The interaction matrix encodes the coalition topology.\00"
@.str.exp_symmetry_breaking.442 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_symmetry_breaking.443 = private unnamed_addr constant [38 x i8] c"  RESULT: Weak group signal detected.\00"
@.str.exp_symmetry_breaking.444 = private unnamed_addr constant [54 x i8] c"  Between-group alpha slightly higher, but gap < 0.1.\00"
@.str.exp_symmetry_breaking.445 = private unnamed_addr constant [56 x i8] c"  RESULT: No group structure in the interaction matrix.\00"
@.str.exp_symmetry_breaking.446 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.447 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_symmetry_breaking.448 = private unnamed_addr constant [64 x i8] c"#  SYMMETRY BREAKING AND PHASE TRANSITIONS                    #\00"
@.str.exp_symmetry_breaking.449 = private unnamed_addr constant [64 x i8] c"#  Structural properties of the interaction matrix            #\00"
@.str.exp_symmetry_breaking.450 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_symmetry_breaking.451 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_symmetry_breaking.452 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_symmetry_breaking.453 = private unnamed_addr constant [27 x i8] c"  ALL EXPERIMENTS COMPLETE\00"
@.str.exp_symmetry_breaking.454 = private unnamed_addr constant [65 x i8] c"================================================================\00"
